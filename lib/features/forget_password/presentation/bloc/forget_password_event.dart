part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {}

class ClickButtonSendRecoveryCode extends ForgetPasswordEvent{
  final String email;

  ClickButtonSendRecoveryCode(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];

}
class ClickButtonChangePassword extends ForgetPasswordEvent{

  final String code;
  final String password;
  final String username;
  ClickButtonChangePassword(this.code,this.password,this.username);

  @override
  // TODO: implement props
  List<Object> get props => [code,password];

}
