part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class clickButtonPress extends RegisterEvent {
  final String username;
  final String password;
  final String phonenumber;
  final String email;
  final String firstname;
  final String lastname;

  clickButtonPress(this.username, this.password, this.phonenumber, this.email,
      this.firstname, this.lastname);

  @override
  List<Object> get props => [username, password, phonenumber, email, firstname,lastname];
}