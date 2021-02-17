import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/splash/domain/entities/splash.dart';
import 'package:flutter_app_clean_auth/features/splash/domain/repositories/repository_splash.dart';

class GiveBool implements UseCase< Splash , NoParams > {
  final SplashRepository repository;

  GiveBool(this.repository);

  @override
  Future<Either<Failure, Splash>> call(NoParams) {
    // TODO: implement call
    return repository.giveBool();
  }
}