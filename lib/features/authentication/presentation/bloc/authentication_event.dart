part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}
class AppStarted extends AuthenticationEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class logOut extends AuthenticationEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class logIn extends AuthenticationEvent{
  final String token;
  final String refreshToken;
  final String expiredToken;

  logIn({this.token, this.refreshToken, this.expiredToken});

  @override
  // TODO: implement props
  List<Object> get props => [token,refreshToken,expiredToken];

}
class CheckAccount extends AuthenticationEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
