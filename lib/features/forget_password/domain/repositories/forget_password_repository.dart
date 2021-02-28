import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';

abstract class ForgetPasswordRepository{
  Future<Either<Failure, bool>> sendRecoveryCode(String email);
  Future<Either<Failure, bool>> changePassword(String code , String password , String username);
}