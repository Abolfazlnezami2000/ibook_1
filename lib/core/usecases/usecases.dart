import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';

abstract class UseCase<Type,Params> {
  Future<Either<Failure, Type>> call(Params params);
}
class NoParams extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props =>[];

}