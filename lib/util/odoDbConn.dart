import 'package:odoapplications/intergrationClass/userIntegration.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

import '../model/user.dart';
    class DataBaseHelper{

      static final DataBaseHelper instance= DataBaseHelper._init();
      static Database? _database;

       DataBaseHelper._init();
       Future<Database> get database async {
         if(_database!=null)return _database!;
         _database= await _initDB('odo.db');
         return _database!;

      }

      Future<Database>_initDB(String path) async {
        final dbpath= await getDatabasesPath();
        final paths = join (dbpath, path);
       return await openDatabase(path,version: 2,onCreate: _createDB);
      }



  Future<FutureOr> _createDB(Database db, int version) async {
         // await db.execute('''CREATE TABLE $userTable(
         // $UserDatabaseIntegrationClass.userId $UserDatabaseIntegrationClass.userIDType,
         // $UserDatabaseIntegrationClass.firstName $UserDatabaseIntegrationClass.nameType,
         // $UserDatabaseIntegrationClass.userName $UserDatabaseIntegrationClass.nameType,
         // $UserDatabaseIntegrationClass.email $UserDatabaseIntegrationClass.nameType,
         // $UserDatabaseIntegrationClass.userPassword $UserDatabaseIntegrationClass.nameType
         // )''');
    await db.execute('CREATE TABLE userTable(userId INTEGER PRIMARY KEY, firstName TEXT, userName TEXT, email TEXT, userPassword TEXT)',);
  }
  Future close() async{
         final db = await instance.database;
         db.close();
  }

  Future<User> create(User user) async {
         final db = await instance.database;
         final id= await db.insert(userTable, user.toMap());
         return user.copyWith(userId: id);
  }
      Future<User> readNotes(int userId) async {
        final db = await instance.database;
        final maps = await db.query(userTable,columns:UserDatabaseIntegrationClass.values,
        where: '${UserDatabaseIntegrationClass.userId}=?',
        whereArgs: [userId]);
        if(maps.isNotEmpty)
          {
            return User.fromMap(maps.first);
          }
        else{
          throw Exception('ID $userId not found');
        }
      }
    }

