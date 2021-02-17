// import 'package:dartz/dartz.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_app_clean_auth/core/error/failures.dart';
// import 'package:flutter_app_clean_auth/features/splash/data/data_sources/splash_local_data_source.dart';
// import 'package:flutter_app_clean_auth/features/splash/domain/entities/splash.dart';
// import 'package:flutter_app_clean_auth/features/splash/domain/repositories/repository_splash.dart';
//
// class SplashRepositoryImpl implements SplashRepository{
//   final SplashLocalDataSource localdataSource;
//
//
//   SplashRepositoryImpl({@required this.localdataSource});
//
//   // @override
//   Future<Either<Failure, Splash>> giveBool() async{
//     // TODO: implement giveBool
//     return await _getAnswer(() {
//       return localdataSource.getLastBool();
//     });
//   }
//   //
//   @override
//   Future<Either<Failure, Splash>> saveBool(bool checkfirstapp) async{
//     // TODO: implement saveBool
//     return await _getAnswer(() {
//       return localdataSource.saveBool(checkfirstapp);
//     });
//   }
//   Future<Either<Failure, NumberTrivia>> _getTrivia(
//       _ConcreteOrRandomChooser getConcreteOrRandom,
//       ) async {
//
// }