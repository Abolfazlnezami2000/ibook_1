import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/features/forget_password/domain/entities/forget_password_entity.dart';


class SendRecoveryCodeModel  extends ForgetPasswordEntity{
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