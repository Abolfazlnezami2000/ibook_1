import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
import 'package:flutter_app_clean_auth/features/login/domain/repositories/login_repository.dart';

class LoginUsecase implements UseCase<AuthenticationEntity, Params> {
  final LoginRepository repository;
  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(Params params) async {
    return await repository.login(params.username, params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;


  Params(
      {@required this.username,
        @required this.password});

  @override
  List<Object> get props => [username, password];
}