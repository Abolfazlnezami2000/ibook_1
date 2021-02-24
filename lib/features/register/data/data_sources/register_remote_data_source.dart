import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/features/register/data/models/register_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSource {
  Future<bool> register(RegisterModel registerModel);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final http.Client client;

  RegisterRemoteDataSourceImpl({@required this.client});

  @override
  Future<bool> register(RegisterModel registerModel) async {
    try {
      final String url = 'http://192.168.43.10:8762/auth/users';
      // final response = await client.post(
      //   url,
      //   body: json.encode(registerModel.toJson()),
      //   headers: {'Content-Type': 'application/json; charset=utf-8'},
      // ).timeout(Duration(seconds: 5));
      if (true) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      return false;
    }
  }
}
