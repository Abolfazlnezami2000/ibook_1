import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/features/forget_password/domain/entities/forget_password_entity.dart';

class ChangePasswordModel extends ForgetPasswordEntity{
  final String code;
  final String password;
  final String username;
  ChangePasswordModel({
    @required this.code,
    @required this.password,
    @required this.username
  });


  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'password': password,
      'username':username,
    };
  }
}