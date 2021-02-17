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
    final String url = 'https://reqres.in/api/register';
    final response = await client.post(
      url,
      body: {"email": "eve.holt@reqres.in", "password": "cityslicka"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
