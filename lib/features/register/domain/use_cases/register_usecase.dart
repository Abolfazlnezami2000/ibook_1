import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/register/domain/repositories/register_repository.dart';

class RegisterUseCase implements UseCase<bool, Params> {
  final RegisterRepository repository;
  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.register(params.username, params.password,
        params.firstname,params.lastname, params.phonenumber, params.email);
  }
}

class Params extends Equatable {
  final String username;
  final String password;
  final String phonenumber;
  final String email;
  final String firstname;
  final String lastname;

  Params(
      {@required this.username,
        @required this.password,
        @required this.phonenumber,
        @required this.email,
        @required this.firstname,
        @required this.lastname});

  @override
  List<Object> get props => [username, password, firstname,lastname, email, phonenumber];
}
