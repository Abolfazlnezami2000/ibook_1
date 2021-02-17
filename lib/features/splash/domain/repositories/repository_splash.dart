import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/features/splash/domain/entities/splash.dart';

abstract class SplashRepository {
  Future<Either<Failure, Splash>> saveBool(bool checkfirstapp);
  Future<Either<Failure, Splash>> giveBool();
}