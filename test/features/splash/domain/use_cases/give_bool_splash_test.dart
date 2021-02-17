// import 'package:dartz/dartz.dart';
// import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
// import 'package:flutter_app_clean_auth/features/splash/domain/entities/splash.dart';
// import 'package:flutter_app_clean_auth/features/splash/domain/repositories/repository_splash.dart';
// import 'package:flutter_app_clean_auth/features/splash/domain/use_cases/give_bool_splash.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// class MockSplashRepository extends Mock implements SplashRepository{}
//
// void main(){
//   MockSplashRepository mockSplashRepository;
//   GiveBool giveBool;
//
//   setUp((){
//     mockSplashRepository = MockSplashRepository();
//     giveBool = GiveBool(mockSplashRepository);
//   });
//   final tSplash = Splash(checkfirstapp: true);
//
//   test("should give token is true ", () async {
//     // arrange
//     when(mockSplashRepository.giveBool()).thenAnswer((_) async => Right(tSplash));
//     // act
//     final result = await giveBool(NoParams);
//     // assert
//     expect(result, Right(tSplash));
//     verify(mockSplashRepository.giveBool());
//   });
//
// }