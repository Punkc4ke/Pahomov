import 'dart:io';

import 'package:conduit/conduit.dart';
import 'package:api/model/user.dart';
import 'package:api/utils/app_response.dart';
import 'package:api/utils/app_utils.dart';
import 'package:api/model/accounting.dart';


class AppAccountingController extends ResourceController {
  AppAccountingController(this.managedContext);

  final ManagedContext managedContext;

  @Operation.get("number")
  Future<Response> getAccounting(
      @Bind.header(HttpHeaders.authorizationHeader) String header,
      @Bind.path("number") int number,
      {@Bind.query("recovery") bool? recovery}) async {
    try {
      final currentUserId = AppUtils.getIdFromHeader(header);

      final deletedAccountingQuery = Query<Accounting>(managedContext)
        ..where((accounting) => accounting.number).equalTo(number)
        ..where((accounting) => accounting.user!.id).equalTo(currentUserId)
        ..where((accounting) => accounting.deleted).equalTo(true);

      final deletedAccounting = await deletedAccountingQuery.fetchOne();

      String message = "Успешное получение отчета";

      if (deletedAccounting != null && recovery != null && recovery) {
        deletedAccountingQuery.values.deleted = false;
        deletedAccountingQuery.update();
        message = "Успешное восстановление отчета";
      }

      final accountingQuery = Query<Accounting>(managedContext)
        ..where((accounting) => accounting.number).equalTo(number)
        ..where((accounting) => accounting.user!.id).equalTo(currentUserId)
        ..where((accounting) => accounting.deleted).equalTo(false);
      final accounting = await accountingQuery.fetchOne();
      if (accounting == null) {
        return AppResponse.ok(message: "Отчет не найдена");
      }
      accounting.removePropertiesFromBackingMap(["user", "id", "deleted"]);
      return AppResponse.ok(body: accounting.backing.contents, message: message);
    } catch (e) {
      return AppResponse.serverError(e, message: 'Ошибка получения отчета');
    }
  }

  @Operation.put("number")
  Future<Response> updateAccounting(
      @Bind.header(HttpHeaders.authorizationHeader) String header,
      @Bind.path("number") int number,
      @Bind.body() Accounting accounting) async {
    try {
      final currentUserId = AppUtils.getIdFromHeader(header);
      final accountingQuery = Query<Accounting>(managedContext)
        ..where((accounting) => accounting.number).equalTo(number)
        ..where((accounting) => accounting.user!.id).equalTo(currentUserId)
        ..where((accounting) => accounting.deleted).equalTo(false);
      final accountingDB = await accountingQuery.fetchOne();
      if (accountingDB == null) {
        return AppResponse.ok(message: "Отчет не найдена");
      }
      final qUpdateAccounting = Query<Accounting>(managedContext)
        ..where((accounting) => accounting.id).equalTo(accountingDB.id)
        ..values.category = accounting.category
        ..values.name = accounting.name
        ..values.description = accounting.description
        ..values.dateOfOperation = DateTime.now().toString();
      await qUpdateAccounting.update();
      return AppResponse.ok(
          body: accounting.backing.contents, message: "Успешное обновление отчета");
    } catch (e) {
      return AppResponse.serverError(e, message: 'Ошибка получения отчета');
    }
  }

  @Operation.get()
  Future<Response> getAccountings(
      @Bind.header(HttpHeaders.authorizationHeader) String header,
      {@Bind.query("search") String? search,
      @Bind.query("limit") int? limit,
      @Bind.query("offset") int? offset,
      @Bind.query("filter") String? filter}) async {
    try {
      final id = AppUtils.getIdFromHeader(header);

      Query<Accounting>? accountingsQuery;

      if (search != null && search != "") {
        accountingsQuery = Query<Accounting>(managedContext)
          ..where((accounting) => accounting.name).contains(search)
          ..where((accounting) => accounting.user!.id).equalTo(id);
      } else {
        accountingsQuery = Query<Accounting>(managedContext)
          ..where((accounting) => accounting.user!.id).equalTo(id);
      }

      switch (filter) {
        case "deleted":
          accountingsQuery.where((accounting) => accounting.deleted).equalTo(true);
          break;
        case "all":
          break;
        default:
          accountingsQuery.where((accounting) => accounting.deleted).equalTo(false);
      }

      if (limit != null && limit > 0) {
        accountingsQuery.fetchLimit = limit;
      }
      if (offset != null && offset > 0) {
        accountingsQuery.offset = offset;
      }

      final accountings = await accountingsQuery.fetch();

      List accountingsJson = List.empty(growable: true);

      for (final accounting in accountings) {
        accounting.removePropertiesFromBackingMap(["user", "id", "deleted"]);
        accountingsJson.add(accounting.backing.contents);
      }

      if (accountingsJson.isEmpty) {
        return AppResponse.ok(message: "Отчеты не найдены");
      }

      return AppResponse.ok(
          message: 'Успешное получение отчетов', body: accountingsJson);
    } catch (e) {
      return AppResponse.serverError(e, message: 'Ошибка получения отчетов');
    }
  }

  @Operation.delete("number")
  Future<Response> deleteAccounting(
      @Bind.header(HttpHeaders.authorizationHeader) String header,
      @Bind.path("number") int number) async {
    try {
      final currentUserId = AppUtils.getIdFromHeader(header);
      final accountingQuery = Query<Accounting>(managedContext)
        ..where((accounting) => accounting.number).equalTo(number)
        ..where((accounting) => accounting.user!.id).equalTo(currentUserId)
        ..where((accounting) => accounting.deleted).equalTo(false);
      final accounting = await accountingQuery.fetchOne();
      if (accounting == null) {
        return AppResponse.ok(message: "Заметка не найдена");
      }
      final qLogicDeleteAccounting = Query<Accounting>(managedContext)
        ..where((accounting) => accounting.number).equalTo(number)
        ..values.deleted = true;
      await qLogicDeleteAccounting.update();
      
      return AppResponse.ok(message: 'Успешное удаление отчета');
    } catch (e) {
      return AppResponse.serverError(e, message: 'Ошибка удаления отчета');
    }
  }

  @Operation.post()
  Future<Response> createAccounting(
      @Bind.header(HttpHeaders.authorizationHeader) String header,
      @Bind.body() Accounting accounting) async {
    try {
      late final int accountingId;

      final id = AppUtils.getIdFromHeader(header);

      final accountingsQuery = Query<Accounting>(managedContext)
        ..where((accounting) => accounting.user!.id).equalTo(id);

      final accountings = await accountingsQuery.fetch();

      final accountingNumber = accountings.length;

      final fUser = Query<User>(managedContext)
        ..where((user) => user.id).equalTo(id);

      final user = await fUser.fetchOne();

      await managedContext.transaction((transaction) async {
        final qCreateAccounting = Query<Accounting>(transaction)
          ..values.number = accountingNumber + 1
          ..values.name = accounting.name
          ..values.description = accounting.description
          ..values.category = accounting.category
          ..values.dateOfOperation = DateTime.now().toString()
          ..values.transactionAmount = accounting.transactionAmount
          ..values.user = user
          ..values.deleted = false;

        final createdAccounting = await qCreateAccounting.insert();

        accountingId = createdAccounting.id!;
      });

      final accountingData = await managedContext.fetchObjectWithID<Accounting>(accountingId);

      accountingData!.removePropertiesFromBackingMap(["user", "id", "deleted"]);
      return AppResponse.ok(
        body: accountingData.backing.contents,
        message: 'Успешное создание отчета',
      );
    } catch (e) {
      return AppResponse.serverError(e, message: 'Ошибка создания отчета');
    }
  }
}