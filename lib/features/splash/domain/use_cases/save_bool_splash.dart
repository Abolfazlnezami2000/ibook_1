import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/save_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/splash/domain/entities/splash.dart';
import 'package:flutter_app_clean_auth/features/splash/domain/repositories/repository_splash.dart';

class SaveBool implements UseCase< Splash , Params > {
  final SplashRepository repository;

  SaveBool(this.repository);

  @override
  Future<Either<Failure, Splash>> call(Params params) {
    // TODO: implement call
    return repository.saveBool(params.checkfirstapp);
  }
}
class Params extends Equatable {
  final checkfirstapp;

  Params({@required this.checkfirstapp});

  @override
  // TODO: implement props
  List<Object> get props => [checkfirstapp];


}