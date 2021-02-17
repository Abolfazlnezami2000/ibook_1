import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/repositories/repository_authentication.dart';

class FindToken implements UseCase<AuthenticationEntity,NoParams>{
  final AuthenticationRepository repository;

  FindToken(this.repository);


  @override
  Future<Either<Failure, AuthenticationEntity>> call(NoParams) {
    // TODO: implement call
    return repository.findToken();
  }
}