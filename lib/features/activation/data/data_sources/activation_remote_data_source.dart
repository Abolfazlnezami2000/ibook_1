import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/features/activation/data/models/activation_model.dart';
import 'package:http/http.dart' as http;

abstract class ActivationRemoteDataSources {

  Future<bool> sendActivationCode(ActivationModel activationmodel);
}

class ActivationRemoteDataSourcesImpl
    implements ActivationRemoteDataSources {
  final http.Client client;

  ActivationRemoteDataSourcesImpl({@required this.client});

  @override
  Future<bool> sendActivationCode(ActivationModel activationmodel) async {
    try {
      final String url = 'http://192.168.43.10:8762/auth/signin';
      // final response = await client.post(
      //   url,
      // body: json.encode(activationmodel.toJson()),
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
