part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {
}

class Empty extends ForgetPasswordState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Loading extends ForgetPasswordState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Loaded extends ForgetPasswordState {
  final String massage;

  Loaded({@required this.massage});

  @override
  List<Object> get props => [massage];
}

class Error extends ForgetPasswordState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
