import 'package:flutter/cupertino.dart';

class ActivationModel {
  final String code;
  final String username;

  ActivationModel({@required this.code, @required this.username});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'username': username,
    };
  }
}
