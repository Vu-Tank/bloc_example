import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String userName;
  final String password;
  final String fullName;
  final String token;
  UserModel({
    required this.userName,
    required this.password,
    required this.fullName,
    required this.token,
  });

  @override
  String toString() {
    return 'UserModel(userName: $userName, password: $password, fullName: $fullName, token: $token)';
  }

  UserModel copyWith({
    String? userName,
    String? password,
    String? fullName,
    String? token,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
      'fullName': fullName,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] as String,
      password: map['password'] as String,
      fullName: map['fullName'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
