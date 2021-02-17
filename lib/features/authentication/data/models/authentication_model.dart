import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
import 'package:meta/meta.dart';
class AuthenticationModel extends AuthenticationEntity{
  AuthenticationModel ({
   @required String token,
   @required String refreshtoken,
   @required DateTime expiredtoken,
}) : super(token: token , refreshToken: refreshtoken , expiredToken: expiredtoken);

  factory AuthenticationModel.fromJson(Map<String, dynamic> json){
    return AuthenticationModel(
      token: json['token'],
      refreshtoken: json['refreshtoken'],
      expiredtoken: json['expiredtoken'],
    );
  }
  Map<String,dynamic> toJson(){
    return{
      'token' : token,
      'refreshtoken' : refreshToken,
      'expiredtoken' : expiredToken,
    };
  }
}