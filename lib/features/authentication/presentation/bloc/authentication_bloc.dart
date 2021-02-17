import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/check_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/delete_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/find_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/save_token_authentication.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SaveToken saveToken;
  final DeleteToken deleteToken;
  final CheckToken checkTokent;
  final FindToken findToken;

  AuthenticationBloc(
      {@required this.saveToken,
      @required this.deleteToken,
      @required this.checkTokent,
      @required this.findToken})
      : assert(saveToken != null),
        assert(deleteToken != null),
        assert(checkTokent != null),
        super(Empty());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is logIn) {
      //AuthenticationLoading
      yield* _mapLoggedInToState(
          event.token, event.refreshToken, event.expiredToken);
    } else if (event is logOut) {
      //AuthenticationLoading
      yield* _mapLoggedOutToState();
    } else if (event is CheckAccount) {
      // develop later
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      // await findToken(NoParams())
      final checkToken = await checkTokent(NoParams());
      //Set this duration to show splash screen.
      await Future.delayed(const Duration(seconds: 4));
      if (checkToken != null && checkTokent == false) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    } catch (exception) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState(
      String token, String refreshToken, DateTime expiredToken) async* {
    final bool checkBoolSave = await saveToken(Params(
        token: token,
        refreshToken: refreshToken,
        expiredToken: expiredToken)) as bool;
    if (checkBoolSave) {
      yield Authenticated();
    } else {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    /// Remove user credentials from device storage.
    await deleteToken(NoParams());
    yield Unauthenticated();
  }
}
