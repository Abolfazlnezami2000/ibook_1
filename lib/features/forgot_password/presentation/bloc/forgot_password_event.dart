part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {}

class ClickButtonSendRecoveryCode extends ForgotPasswordEvent{
  final String email;

  ClickButtonSendRecoveryCode(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];

}
class ClickButtonChangePassword extends ForgotPasswordEvent{
  final String code;
  final String password;
  final String username;
  ClickButtonChangePassword(this.code,this.password,this.username);

  @override
  // TODO: implement props
  List<Object> get props => [code,password];

}
