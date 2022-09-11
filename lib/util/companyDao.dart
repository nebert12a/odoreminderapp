

import '../intergrationClass/userIntegration.dart';
import '../model/compan_owner.dart';
import 'odoDbConn.dart';

class CompanyDao {
  //
  // Future<void> watchAllOwnerTable() async {
  //   final db= await DataBaseHelper.instance.database;
  //   db.query(table)
  // }
  static Future<CompanyOwner> createOwner(CompanyOwner owner) async {
    final db= await DataBaseHelper.instance.database;
    final id= await db.insert("companyTable",owner.toMap());
    return owner.copyWith(id: id);
  }
  static Future<List<Map>> loginOwner(String ownerEmail, String ownerPassword) async {
    final db= await DataBaseHelper.instance.database;
    List<Map> owner= await db.query("companyTable",columns: ['mailAddress','password','companyName'], where: 'mailAddress=?',
              whereArgs: [ownerEmail]);
    return owner;
  }


  // Future<User> create(User user) async {
  //   final db = await instance.database;
  //   final id= await db.insert(userTable, user.toMap());
  //   return user.copyWith(userId: id);
  // }
  // Future<User> readNotes(int userId) async {
  //   final db = await instance.database;
  //   final maps = await db.query(userTable,columns:UserDatabaseIntegrationClass.values,
  //       where: '${UserDatabaseIntegrationClass.userId}=?',
  //       whereArgs: [userId]);
  //   if(maps.isNotEmpty)
  //   {
  //     return User.fromMap(maps.first);
  //   }
  //   else{
  //     throw Exception('ID $userId not found');
  //   }
  // }
  // Future<List<Map<String, Object?>>> retrieveUser() async {
  //   final db = await instance.database;
  //   final maps= await db.query(userTable,columns:['userId','firstName']);
  //   if(maps.isNotEmpty)
  //   {
  //     return maps;
  //   }
  //   else{
  //     throw Exception('User not found');
  //   }
  // }
  // Future<List<User>> retrieveUsers() async {
  //   final db = await instance.database;
  //   final List<Map<String, Object?>> queryResult = await db.query('userTable');
  //   return queryResult.map((e) => User.fromMap(e)).toList();
  // }
  // Stream<List<CompanyOwner>> watchAllOwnerTable() =>db.;
  // Future insertOwnerTable(OwnerDao owner) => into(tasks).insert(owner);
  // Future updateOwnerTable(OwnerDao owner) => update(tasks).replace(owner);
  // Future deleteOwnerTable(OwnerDao owner) => delete(tasks).delete(owner);

}