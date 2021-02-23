import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/repositories/forgot_password_repository.dart';

class ChangePasswordUseCase extends UseCase<bool , ChangePasswordParams>{
  final ForgotPasswordRepository repository;

  ChangePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(ChangePasswordParams params) async{
    // TODO: implement call
    return await repository.changePassword(params.code, params.password , params.username);
  }

}
class ChangePasswordParams extends Equatable{
  final code;
  final password;
  final username;

  ChangePasswordParams({@required this.code,@required this.password,@required this.username});

  @override
  // TODO: implement props
  List<Object> get props => [code,password,username];
}