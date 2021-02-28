import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/features/forget_password/data/models/change_password_forget_password_model.dart';
import 'package:flutter_app_clean_auth/features/forget_password/data/models/send_recovery_code_forget_password_model.dart';
import 'package:http/http.dart' as http;

abstract class ForgetPasswordRemoteDataSources {
  Future<bool> changePassword(ChangePasswordModel modelChangePassword);

  Future<bool> sendRecoveryCode(SendRecoveryCodeModel modelSendRecoveryCode);
}

class ForgetPasswordRemoteDataSourcesImpl
    implements ForgetPasswordRemoteDataSources {
  final http.Client client;

  ForgetPasswordRemoteDataSourcesImpl({@required this.client});

  @override
  Future<bool> changePassword(ChangePasswordModel modelChangePassword) async {
    try {
      final String url = 'http://192.168.43.10:8762/auth/signin';
      // final response = await client.post(
      //   url,
      // body: json.encode(modelChangePassword.toJson()),
      // headers: {
      //   'Content-Type': 'application/json; charset=utf-8'
      // }).timeout(Duration(seconds: 6));

      if (true) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw ServerException();
    }
  }

  @override
  Future<bool> sendRecoveryCode(
      SendRecoveryCodeModel modelSendRecoveryCode) async {
    // TODO: implement sendEmail
    try {
      // final String url = 'http://192.168.43.10:8762/auth/signin';
      // final response = await client.post(
      //     url,
      // body: json.encode(modelSendRecoveryCode.toJson()),
      // headers: {
      //   'Content-Type': 'application/json; charset=utf-8'
      // }).timeout(Duration(seconds: 6));

      if (true) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw ServerException();
    }
  }
}
