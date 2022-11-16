import 'dart:io';

import 'package:path/path.dart';
import 'package:pr1/common/data_base_request.dart';
import 'package:pr1/data/model/contract.dart';
import 'package:pr1/data/model/role.dart';
import 'package:pr1/data/model/supplier.dart';
import 'package:pr1/data/model/tovar.dart';
import 'package:pr1/data/model/transportcompany.dart';
import 'package:pr1/data/model/unitofmeasurement.dart';
import 'package:pr1/data/model/user.dart';
import 'package:pr1/data/model/vidtovara.dart';
import 'package:pr1/data/model/contactperson.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late Directory _appDocumentDirectory;
  late String _pathDB;
  late Database dataBase;
  int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'booksstore.db');

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
              onUpgrade: (db, oldVersion, newVersion) async =>
                  await onUpgradeTable(db),
              version: _version,
              onCreate: (db, version) async {
                await onCreateTable(db);
              }));
    } else {
      dataBase = await openDatabase(_pathDB,
          onUpgrade: (db, oldVersion, newVersion) async =>
              await onUpgradeTable(db),
          version: _version,
          onCreate: (db, version) async {
            await onCreateTable(db);
          });
    }
  }

  Future<void> onUpgradeTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element["name"] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var i = 0; i < DataBaseRequest.tableList.length; i++) {
      await db.execute(DataBaseRequest.createTableList[i]);
    }
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(
          DataBaseRequest.tableRole, Role(role_name: 'Администратор').ToMap());
      db.insert(
          DataBaseRequest.tableRole, Role(role_name: 'Пользователь').ToMap());

      db.insert(DataBaseRequest.tableUsers,
          Users(login: "lol", password: "kek", id_role: 1).ToMap());

      db.insert(DataBaseRequest.tableVidTovara,
          VidTovara(vidtovara_name: "Что-то").ToMap());

      db.insert(
          DataBaseRequest.tableContactPerson,
          ContactPerson(
                  familia: "Иванов",
                  name: "Иван",
                  otchestvo: "Иванович",
                  phone: "654673948")
              .ToMap());

      db.insert(DataBaseRequest.tableSupplier,
          Supplier(name_org: "ООО ПОСТАВЩИК", id_contactperson: 1).ToMap());

      db.insert(
          DataBaseRequest.tableTransportCompany,
          TransportCompany(company_name: "Доставка", contactphone: "347856035")
              .ToMap());

      db.insert(DataBaseRequest.tableUnitOfMeasurement,
          UnitOfMeasurement(unitofmeasurement_name: "килограмм").ToMap());

      db.insert(
          DataBaseRequest.tableTovar,
          Tovar(
                  tovar_name: "Шоколад",
                  count: 151,
                  data_p: "15.11.2022",
                  id_vidtovara: 1,
                  id_supplier: 1,
                  id_unitofmeasurement: 1)
              .ToMap());

      db.insert(
          DataBaseRequest.tableContract,
          Contract(
                  id_supplier: 1,
                  dateofconclusion: "10.11.2022",
                  validityperiod: "10.12.2022",
                  id_tovar: 1,
                  id_transportcompany: 1)
              .ToMap());
    } on DatabaseException catch (e) {
      print(1);
    }
  }

  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
