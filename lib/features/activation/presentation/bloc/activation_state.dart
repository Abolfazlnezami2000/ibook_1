part of 'activation_bloc.dart';

abstract class ActivationState extends Equatable {}


class Empty extends ActivationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Loading extends ActivationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Loaded extends ActivationState {
  final String massage;

  Loaded({@required this.massage});

  @override
  List<Object> get props => [massage];
}

class Error extends ActivationState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}

