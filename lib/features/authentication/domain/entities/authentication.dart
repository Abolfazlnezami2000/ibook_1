import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// ignore: must_be_immutable
class AuthenticationEntity extends Equatable {
  final String token;
  final String refreshToken;
  final DateTime expiredToken;

  AuthenticationEntity(
      {@required this.token,
      @required this.refreshToken,
      @required this.expiredToken});

  @override
  // TODO: implement props
  List<Object> get props => [token, refreshToken, expiredToken];
}
