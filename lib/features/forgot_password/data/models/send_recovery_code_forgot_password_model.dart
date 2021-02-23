import 'package:flutter/cupertino.dart';

class SendRecoveryCodeModel  {
  final String email;
  SendRecoveryCodeModel({
    @required this.email
  });
  factory SendRecoveryCodeModel.fromJson(Map<String, dynamic> json) {
    return SendRecoveryCodeModel(
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}