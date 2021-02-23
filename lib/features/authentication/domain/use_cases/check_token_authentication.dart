import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/repositories/repository_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/save_token_authentication.dart';

class CheckToken implements UseCase<bool,NoParams>{
  final AuthenticationRepository repository;

  CheckToken(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams) {
    // TODO: implement call
    return repository. checkToken();
  }
}