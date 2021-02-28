import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/network/network_info.dart';
import 'package:flutter_app_clean_auth/features/forget_password/data/data_sources/forget_password_local_data_source.dart';
import 'package:flutter_app_clean_auth/features/forget_password/data/models/change_password_forget_password_model.dart';
import 'package:flutter_app_clean_auth/features/forget_password/data/models/send_recovery_code_forget_password_model.dart';
import 'package:flutter_app_clean_auth/features/forget_password/domain/repositories/forget_password_repository.dart';


class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSourcesImpl remoteDataSource;
  final NetworkInfo networkInfo;

  ForgetPasswordRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> changePassword(
      String code, String password, String username) async {
    if (await networkInfo.isConnected) {
      try {
        final respons = await remoteDataSource.changePassword(
            ChangePasswordModel(
                code: code, password: password, username: username));
        return Right(respons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> sendRecoveryCode(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final respons = await remoteDataSource
            .sendRecoveryCode(SendRecoveryCodeModel(email: email));
        return Right(respons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
