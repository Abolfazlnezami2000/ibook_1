import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/network/network_info.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
import 'package:flutter_app_clean_auth/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:flutter_app_clean_auth/features/login/data/models/login_model.dart';
import 'package:flutter_app_clean_auth/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSourceImpl remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> login(String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final respons = await remoteDataSource.login(LoginModel(username: username, password: password));
        return Right(respons);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      throw ServerFailure();
    }
  }
}
