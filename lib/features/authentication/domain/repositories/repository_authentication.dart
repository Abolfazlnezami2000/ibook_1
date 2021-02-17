import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';

abstract class AuthenticationRepository{
  Future<Either<Failure, bool>> saveToken(AuthenticationEntity tempAuthentication);
  Future<Either<Failure, bool>> deleteToken();
  Future<Either<Failure, bool>> checkToken();
  Future<Either<Failure, AuthenticationEntity>> findToken();
}