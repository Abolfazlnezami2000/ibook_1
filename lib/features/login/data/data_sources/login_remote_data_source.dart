import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
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
    final String url = 'https://reqres.in/api/login';
    final response = await client.post(
      url,
      body: {"email": "eve.holt@reqres.in", "password": "cityslicka"},
    );
    if (response.statusCode == 200) {
      final responstest = AuthenticationEntity(
          token: "sdasdasd123123",
          refreshToken: "asdasdsad134123",
          expiredToken: DateTime.now());
      return responstest;
    } else {
      throw ServerException();
    }
  }
}
