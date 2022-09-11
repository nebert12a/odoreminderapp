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

    // print(directory.toString());
    final dbpath = await getDatabasesPath();
    String paths = '${directory.path}+' '+ app.db';
    // final paths = join (dbpath, path);
    print(paths);
    return await openDatabase(paths,
        version: 1, onCreate: _createDB, onConfigure: _onConfigure, );
  }

  Future<FutureOr> _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE companyTable(id INTEGER PRIMARY KEY, companyName TEXT, ownerName TEXT, mailAddress TEXT, password TEXT,phoneNumber TEXT,chooseCountry TEXT,creationDate TEXT )',
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
