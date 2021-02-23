import 'package:flutter/cupertino.dart';

class ChangePasswordModel  {
  final String code;
  final String password;
  final String username;
  ChangePasswordModel({
    @required this.code,
    @required this.password,
    @required this.username
  });
  // factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
  //   return ChangePasswordModel(
  //     code: json['code'],
  //     password: json['password'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'password': password,
      'username':username,
    };
  }
}