import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/use_cases/change_password_forgot_password.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/use_cases/send_recovery_code_forgot_password.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ChangePasswordUseCase useCaseChangePassword;
  final SendRecoveryCodeUseCase useCaseSendRecoveryCode;

  ForgotPasswordBloc(
      {@required this.useCaseChangePassword,
      @required this.useCaseSendRecoveryCode})
      : assert(useCaseChangePassword != null),
        assert(useCaseSendRecoveryCode != null),
        super(Empty());

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ClickButtonSendRecoveryCode) {
      yield Loading();
      await Future.delayed(Duration(seconds: 5));
      final Either<Failure, bool> failureOrSend = await useCaseSendRecoveryCode(
          SendRecoveryCodeParams(email: event.email));
      yield failureOrSend.fold(
        (failure) => Error(message: 'ERROR'),
        (response) {
          if (response == true) {
            return Loaded(massage: 'successfully Send Email');
          } else {
            return Error(message: 'ERROR');
          }
        },
      );
    } else if (event is ClickButtonChangePassword) {
      yield Loading();
      final Either<Failure, bool> failureOrChange = await useCaseChangePassword(
          ChangePasswordParams(
              code: event.code,
              password: event.password,
              username: event.username));
      yield failureOrChange.fold(
        (failure) => Error(message: 'ERROR'),
        (respons) {
          if (respons == true) {
            return Loaded(massage: 'successfully Change Password');
          } else {
            return Error(message: 'ERROR');
          }
        },
      );
    } else {
      yield Error(message: 'ERROR');
    }
  }
}
