import 'dart:convert';

import 'package:collection/collection.dart';

class User {
  int? userId;
  String? firstName;
  String? userName;
  String? email;
  String? userPassword;

  User({
    this.userId,
    this.firstName,
    this.userName,
    this.email,
    this.userPassword,
  });

  @override
  String toString() {
    return 'User(userId: $userId, firstName: $firstName, userName: $userName, email: $email, userPassword: $userPassword)';
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
    userId: data['userId'] as int?,
    firstName: data['firstName'] as String?,
    userName: data['userName'] as String?,
    email: data['email'] as String?,
    userPassword: data['userPassword'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'firstName': firstName,
    'userName': userName,
    'email': email,
    'userPassword': userPassword,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }
//  / `dart:convert`
//  /
//  / Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    int? userId,
    String? firstName,
    String? userName,
    String? email,
    String? userPassword,
  }) {
    return User(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      userPassword: userPassword ?? this.userPassword,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      userId.hashCode ^
      firstName.hashCode ^
      userName.hashCode ^
      email.hashCode ^
      userPassword.hashCode;
}
