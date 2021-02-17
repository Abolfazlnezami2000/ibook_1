part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class Empty extends AuthenticationState {
  @override
  List<Object> get props => [];
}
class Authenticated extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class Unauthenticated extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
