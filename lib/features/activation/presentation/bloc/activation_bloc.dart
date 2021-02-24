import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/features/activation/domain/use_cases/send_code_activation.dart';

part 'activation_event.dart';

part 'activation_state.dart';

class ActivationBloc extends Bloc<ActivationEvent, ActivationState> {
  final SendCodeActivation usecase;

  ActivationBloc({@required this.usecase})
      : assert(usecase != null),
        super(Empty());

  @override
  Stream<ActivationState> mapEventToState(
    ActivationEvent event,
  ) async* {
    if (event is ClickButtonActivation) {
      yield Loading();
      await Future.delayed(Duration(seconds: 5));
      final Either<Failure, bool> failureOrActivation = await usecase(
          ActivationCodeParams(code: event.code, username: event.username));
      yield failureOrActivation.fold(
        (failure) => Error(message: 'ERROR'),
        (response) {
          if (response == true) {
            return Loaded(massage: 'successfully Send Email');
          } else {
            return Error(message: 'ERROR');
          }
        },
      );
    }
  }
}
