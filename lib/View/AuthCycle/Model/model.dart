// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

// ignore: non_constant_identifier_names
UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  User? data;
  String? message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    success: json["success"],
    data: User.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "message": message,
  };
}

class User {
  User({
    this.token,
    this.name,
  });

  String? token;
  String? name;

  factory User.fromJson(Map<String, dynamic> json) => User(
    token: json["token"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "name": name,
  };
}