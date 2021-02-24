part of 'activation_bloc.dart';

abstract class ActivationEvent extends Equatable {}

class ClickButtonActivation extends ActivationEvent{
  final String code;
  final String username;

  ClickButtonActivation({this.code, this.username});

  @override
  // TODO: implement props
  List<Object> get props => [code,username];

}
