const String userTable='userTable';

class UserDatabaseIntegrationClass{
 static final List<String> values= [firstName,userName,email,userPassword];
 static const String userId='_userId';
  static const String firstName= 'firstName';
 static const String userName= 'userName';
 static const  String email='email';
 static const String userPassword='userPassword';
 final userIDType ='INTEGER PRIMARY KEY AUTOINCREMENT';
 final nameType= 'TEXT NOT NULL';
}