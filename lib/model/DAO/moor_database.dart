// import 'package:moor/moor.dart';
// import 'package:moor_flutter/moor_flutter.dart';
//
// part 'moor_database.g.dart';
// class OwnerTable extends Table {
//   // autoIncrement automatically sets this to be the primary key
//   IntColumn get id => integer().autoIncrement()();
//   // If the length constraint is not fulfilled, the Task will not
//   // be inserted into the database and an exception will be thrown.
//   TextColumn get companyName => text().withLength(min: 1, max: 50)();
//   TextColumn get ownerName => text().withLength(min: 1, max: 50)();
//   TextColumn get mailAddress => text().withLength(min: 1, max: 50)();
//   TextColumn get password => text().withLength(min: 1, max: 50)();
//   TextColumn get phoneNumber => text().withLength(min: 1, max: 50)();
//   TextColumn get chooseCountry => text().withLength(min: 1, max: 50)();
//   // DateTime is not natively supported by SQLite
//   // Moor converts it to & from UNIX seconds
//   DateTimeColumn get dueDate => dateTime().nullable()();
//
// }
// @UseMoor(tables: [OwnerTable], daos:[OwnerDao] )
// // _$AppDatabase is the name of the generated class
// class AppDatabase extends _$AppDatabase {
//   AppDatabase()
//   // Specify the location of the database file
//       : super((FlutterQueryExecutor.inDatabaseFolder(
//     path: 'app_db.sqlite',
//     // Good for debugging - prints SQL in the console
//     logStatements: true,
//   )));
//
//   // Bump this when changing tables and columns.
//   // Migrations will be covered in the next part.
//   @override
//   int get schemaVersion => 1;
// }
//
// @UseDao(tables: [OwnerTable])
// class OwnerDao extends DatabaseAccessor<AppDatabase> with _$OwnerDaoMixin {
//   final AppDatabase db;
//
//   // Called by the AppDatabase class
//   OwnerDao(this.db) : super(db);
//
//   // Future insertTask(Insertable<OwnerTable> owner) => into().insert(owner);
//   // Future updateTask(Insertable<OwnerTable> owner) => update().replace(owner);
//   // Future deleteTask(Insertable<OwnerTable> owner) => delete().delete(owner);
//
//   Future<List> getAllOwnerTable() => select(owner).get();
//   Future<List> getAllOwnerTableOwner(){
//     return select(OwnerTable).get();
//   }
//
//   Stream<List<OwnerDao>> watchAllOwnerTable() => select(owner).watch();
//   Future insertOwnerTable(OwnerDao owner) => into(tasks).insert(owner);
//   Future updateOwnerTable(OwnerDao owner) => update(tasks).replace(owner);
//   Future deleteOwnerTable(OwnerDao owner) => delete(tasks).delete(owner);
//
// }