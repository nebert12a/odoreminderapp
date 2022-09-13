import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._init();
  static Database? _database;

  DataBaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('odo.db');
    return _database!;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> _initDB(String path) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String paths = '${directory.path}+' '+ app1.db';
    print(paths);
    return await openDatabase(paths,
        version: 4, onCreate: _createDB, onConfigure: _onConfigure,
        onUpgrade: (Database db, int version, int newVer) async {
      // await db.execute(
      //   'CREATE ALTER TABLE itemTable ADD purpose TEXT DEFAULT created',
      // );
    });
  }

  Future<FutureOr> _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE companyTable(id INTEGER PRIMARY KEY, companyName TEXT, ownerName TEXT, mailAddress TEXT, password TEXT,phoneNumber TEXT,chooseCountry TEXT,creationDate TEXT )',
    );
    await db.execute(
      'CREATE TABLE itemTable(id INTEGER PRIMARY KEY, itemName TEXT, quantityOfItem TEXT, barcode TEXT, sellingPrice TEXT,purchasePrice TEXT,openingStock TEXT,openingStockValue TEXT,openingStockRecord TEXT,manufacturer TEXT,brand TEXT,vendor TEXT,recordLevel TEXT,purpose TEXT DEFAULT created, dateInserted DEFAULT CURRENT_TIMESTAMP)',
    );
  }

  _onUpGradeDB(Database db, int version, int newVer) async {
    await db.execute(
      'CREATE TABLE companyTable(id INTEGER PRIMARY KEY, companyName TEXT, ownerName TEXT, mailAddress TEXT, password TEXT,phoneNumber TEXT,chooseCountry TEXT,creationDate TEXT )',
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
