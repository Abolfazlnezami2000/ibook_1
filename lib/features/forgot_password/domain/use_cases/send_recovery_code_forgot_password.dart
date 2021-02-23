import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/repositories/forgot_password_repository.dart';

class SendRecoveryCodeUseCase extends UseCase<bool , SendRecoveryCodeParams>{
  final ForgotPasswordRepository repository;

  SendRecoveryCodeUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(SendRecoveryCodeParams params) async{
    // TODO: implement call
    return await repository.sendRecoveryCode(params.email);
  }

}
class SendRecoveryCodeParams extends Equatable{
  final email;

  SendRecoveryCodeParams({@required this.email});

  @override
  // TODO: implement props
  List<Object> get props => [email];
}