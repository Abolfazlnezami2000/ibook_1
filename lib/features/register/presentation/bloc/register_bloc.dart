import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/features/register/domain/use_cases/register.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Register register;

  RegisterBloc({@required this.register})
      : assert(register != null),
        super(Empty());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is clickButtonPress) {
      yield Loading();
      //yield* _startProcessLogin(event.username, event.password);
      final Either<Failure, bool> failureOrRegister =
          await register(Params(
              username: event.username,
              password: event.password,
              firstname: event.firstname,
              lastname: event.lastname,
              phonenumber: event.phonenumber,
              email: event.email));
      yield failureOrRegister.fold(
        (failure) => Error(message: 'ERROR'),
        (respons) {
          if (respons) {
            return Loaded(massage: 'successfully Login');
          } else {
            return Error(message: 'Error');
          }
        },
      );
    } else {
      yield Error(message: 'ERROR');
    }
  }
}
