abstract class DataBaseRequest{

  static String deleteTable(String table) => 'DROP TABLE $table';

  /// Таблица Роли
  ///
  /// Поля таблицы: Название роли
  static const String tableRole = 'Role';

  /// Таблица Пользователи
  ///
  /// Поля таблицы: Логин, Пароль, Роль
  static const String tableUsers = 'Users';

  /// Таблица Поставщики
  static const String tableSupplier = 'Supplier';

  /// Таблица Видов товаров
  static const String tableVidTovara = 'VidTovara';

  /// Таблица Контактных лиц  
  static const String tableContactPerson = 'ContactPerson';

  /// Таблица Транспортных фирм 
  static const String tableTransportCompany = 'TransportCompany';

/// Таблица Единиц измерения 
  static const String tableUnitOfMeasurement = 'UnitOfMeasurement';
  /// Таблица Товаров 
  static const String tableTovar = 'Tovar';
  
  /// Таблица Контрактов 
  static const String tableContract = 'Contract';

  static const List<String> tableList = [tableRole, tableUsers, tableContactPerson, tableSupplier, tableTransportCompany,
  tableVidTovara, tableUnitOfMeasurement, tableContract, tableTovar];

  static const List<String> createTableList = [
    _createTableRole,
    _createTableUsers,
    _createTableSupplier,
    _createTableContactPerson,
    _createTableTransportCompany,
    _createTableVidTovara,
    _createTableUnitOfMeasurement,
    _createTableTovar,
    _createTableContract 
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role_name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER, FOREIGN KEY("id_role") REFERENCES "Role"("id"), PRIMARY KEY("id"))';

  /// Запрос для создания таблицы ContactPerson
  static const String _createTableContactPerson =
      'CREATE TABLE "$tableContactPerson" ("id" INTEGER, "familia"	TEXT NOT NULL, "name"	TEXT NOT NULL, "otchestvo" TEXT NULL, "phone"	TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Supplier
  static const String _createTableSupplier =
      'CREATE TABLE "$tableSupplier" ("id" INTEGER,"name_org"	TEXT NOT NULL UNIQUE,"id_contactperson"	INTEGER, FOREIGN KEY("id_contactperson") REFERENCES "ContactPerson"("id"), PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы TransportCompany
  static const String _createTableTransportCompany =
      'CREATE TABLE "$tableTransportCompany" ("id" INTEGER,"company_name"	TEXT NOT NULL UNIQUE, "contactphone"	TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы VidTovara
  static const String _createTableVidTovara =
      'CREATE TABLE "$tableVidTovara" ("id" INTEGER,"vidtovara_name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы UnitOfMeasurement
  static const String _createTableUnitOfMeasurement =
      'CREATE TABLE "$tableUnitOfMeasurement" ("id" INTEGER,"unitofmeasurement_name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Tovar
  static const String _createTableTovar =
      'CREATE TABLE "$tableTovar" ("id"	INTEGER, "tovar_name" TEXT NOT NULL, "count" INTEGER NOT NULL, "data_p" TEXT NOT NULL, "id_vidtovara" INTEGER, "id_supplier" INTEGER,  "id_unitofmeasurement" INTEGER, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_supplier") REFERENCES "Supplier"("id"), FOREIGN KEY("id_vidtovara") REFERENCES "VidTovara"("id"), FOREIGN KEY("id_unitofmeasurement") REFERENCES "UnitOfMeasurement"("id"))';

  /// Запрос для создания таблицы Contract
  static const String _createTableContract =
      'CREATE TABLE "$tableContract" ("id"	INTEGER,"dateofconclusion"	TEXT NOT NULL, "validityperiod"	TEXT NOT NULL, "id_supplier"	INTEGER, "id_tovar"	INTEGER, "id_transportcompany"	INTEGER, PRIMARY KEY("id" AUTOINCREMENT),  FOREIGN KEY("id_transportcompany") REFERENCES "TransportCompany"("id"), FOREIGN KEY("id_supplier") REFERENCES "Supplier"("id"), FOREIGN KEY("id_tovar") REFERENCES "Tovar"("id"))';

}