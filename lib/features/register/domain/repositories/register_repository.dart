
import 'package:dartz/dartz.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';

abstract class RegisterRepository {
  Future<Either<Failure, bool>> register(
      String firstname, String lastname, String username,String password, String phonenumber, String email);
}