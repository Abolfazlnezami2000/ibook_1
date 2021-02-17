import 'package:equatable/equatable.dart';

class Failure extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => [];

}
// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
class CacheFailureToken extends Failure {}