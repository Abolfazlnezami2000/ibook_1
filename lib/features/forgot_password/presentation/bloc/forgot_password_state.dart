part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
}

class Empty extends ForgotPasswordState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Loading extends ForgotPasswordState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Loaded extends ForgotPasswordState {
  final String massage;

  Loaded({@required this.massage});

  @override
  List<Object> get props => [massage];
}

class Error extends ForgotPasswordState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
