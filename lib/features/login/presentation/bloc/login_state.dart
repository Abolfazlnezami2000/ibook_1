part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends LoginState {}

class Loading extends LoginState {}

class Loaded extends LoginState {
  final String massage;

  Loaded({@required this.massage});

  @override
  List<Object> get props => [massage];
}

class Error extends LoginState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}