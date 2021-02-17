import 'package:flutter/cupertino.dart';

class LoginModel{
  final String username;
  final String password;


  LoginModel({@required this.username,@required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}