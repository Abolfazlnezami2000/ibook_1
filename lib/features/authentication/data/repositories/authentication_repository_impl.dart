import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/features/authentication/data/data_sources/authentication_local_data_source.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/repositories/repository_authentication.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSources dataSources;

  AuthenticationRepositoryImpl({@required this.dataSources});

  @override
  Future<Either<Failure, bool>> deleteToken() async {
    try {
      final bool deleteToken = await dataSources.deleteToken();
      return Right(deleteToken);
    } on CacheException {
      return Right(false);
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> findToken() async {
    final isUserAuthenticated = await dataSources.findToken();
    if (isUserAuthenticated != null) {
      return Right(isUserAuthenticated);
    } else {
      return Left(CacheFailureToken());
    }
  }

  @override
  Future<Either<Failure, bool>> saveToken(
      AuthenticationEntity tempAuthentication) async {
    try {
      dataSources.addAuthentication(tempAuthentication);
      return Right(true);
    } on CacheException {
      return Right(false);
    }
  }

  @override
  Future<Either<Failure, bool>> checkToken() async {
    final String token = await dataSources.checkToken();
    if (token != null && token.isNotEmpty) {
      return Right(true);
    } else {
      return Left(CacheFailureToken());
    }
  }
}