part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends RegisterState {}

class Loading extends RegisterState {}

class Loaded extends RegisterState {
  final String massage;

  Loaded({@required this.massage});

  @override
  List<Object> get props => [massage];
}

class Error extends RegisterState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}