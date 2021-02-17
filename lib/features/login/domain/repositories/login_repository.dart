import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';

abstract class LoginRepository {
  Future<Either<Failure, AuthenticationEntity>> login(
      String username, String password);
}