import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/features/authentication/data/models/authentication_model.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
import 'package:flutter_app_clean_auth/features/login/data/models/login_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<AuthenticationEntity> login(LoginModel loginModel);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSourceImpl({@required this.client});

  @override
  Future<AuthenticationEntity> login(LoginModel loginModel) async {

    try {
      final String url = 'http://192.168.43.10:8762/auth/signin';
      final response = await client.post(url,
          body: json.encode(loginModel.toJson()),
          headers: {
            'Content-Type': 'application/json; charset=utf-8'
          }).timeout(Duration(seconds: 6));

      if (response.statusCode == 200) {
        final responsforwork = response.body;
        final finalauthenticationmodel =
        AuthenticationModel.fromJson(json.decode(responsforwork));
        final finalauthenticationrespons = AuthenticationEntity(
          token: finalauthenticationmodel.token,
          refreshToken: finalauthenticationmodel.refreshToken,
          expiredToken: 'kjakjfhgd'//finalauthenticationmodel.expiredToken,
        );
        return finalauthenticationrespons;
      } else {
        throw ServerException();
      }
    } catch (exception) {
      throw ServerException();
    }
  }
}
