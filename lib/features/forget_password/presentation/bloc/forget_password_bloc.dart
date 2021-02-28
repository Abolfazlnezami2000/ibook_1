import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/features/forget_password/domain/use_cases/change_password_forget_password.dart';
import 'package:flutter_app_clean_auth/features/forget_password/domain/use_cases/send_recovery_code_forget_password.dart';


part 'forget_password_event.dart';

part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ChangePasswordUseCase useCaseChangePassword;
  final SendRecoveryCodeUseCase useCaseSendRecoveryCode;

  ForgetPasswordBloc(
      {@required this.useCaseChangePassword,
      @required this.useCaseSendRecoveryCode})
      : assert(useCaseChangePassword != null),
        assert(useCaseSendRecoveryCode != null),
        super(Empty());

  @override
  Stream<ForgetPasswordState> mapEventToState(
    ForgetPasswordEvent event,
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
