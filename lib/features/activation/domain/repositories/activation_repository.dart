import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';

abstract class ActivationRepository {
  Future<Either<Failure, bool>> sendCodeActivation(String code , String username);
}