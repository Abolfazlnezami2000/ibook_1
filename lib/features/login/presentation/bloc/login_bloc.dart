import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_app_clean_auth/features/login/domain/use_cases/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase login;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.login, @required this.authenticationBloc})
      : assert(login != null),
        assert(authenticationBloc != null),
        super(Empty());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    if (event is clickButtonPress) {
      yield Loading();
      //yield* _startProcessLogin(event.username, event.password);
      final Either<Failure, AuthenticationEntity> failureOrLogin =
      await login(Params(username: event.username, password: event.password));
      yield failureOrLogin.fold(
            (failure) => Error(message: 'ERROR'),
            (authtication) {
          authenticationBloc.add(logIn(
              token: authtication.token,
              refreshToken: authtication.refreshToken,
              expiredToken: authtication.expiredToken));
              return Loaded(massage: 'successfully Login');
        },
      );
    }
    else {
      yield Error(message: 'ERROR');
    }
  }
}
// Stream<LoginState> _startProcessLogin(String username,
//     String password) async* {
//   final Either<Failure, AuthenticationEntity> failureOrLogin =
//   await login(Params(username: username, password: password));
//   yield failureOrLogin.fold(
//         (failure) => Error(message: 'ERROR'),
//         (authtication) {
//       authenticationBloc.add(logIn(
//           token: authtication.token,
//           refreshToken: authtication.refreshToken,
//           expiredToken: authtication.expiredToken));
//           return Loaded(massage: 'successfully Login');
//     },
//   );
// }
// authenticationBloc.add(logIn(
// token: r.token,
// refreshToken: r.refreshToken,
// expiredToken: r.expiredToken)




