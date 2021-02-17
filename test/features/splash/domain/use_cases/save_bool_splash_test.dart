// import 'package:dartz/dartz.dart';
// import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/save_token_authentication.dart';
// import 'package:flutter_app_clean_auth/features/splash/domain/entities/splash.dart';
// import 'package:flutter_app_clean_auth/features/splash/domain/repositories/repository_splash.dart';
// import 'package:flutter_app_clean_auth/features/splash/domain/use_cases/save_bool_splash.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// class MockSplashRepository extends Mock implements SplashRepository{}
//
// void main(){
//   MockSplashRepository mockSplashRepository;
//   SaveBool saveBool;
//
//   setUp((){
//     mockSplashRepository = MockSplashRepository();
//     saveBool = SaveBool(mockSplashRepository);
//   });
//   final tCheckfirstapp = false;
//   final tSplash = Splash(checkfirstapp: true);
//   test("should save token is true ", () async {
//     // arrange
//     when(mockSplashRepository.saveBool(any)).thenAnswer((_) async => Right(tSplash));
//     // act
//     final result = await saveBool(Params(checkfirstapp : tCheckfirstapp));
//     // assert
//     expect(result, Right(tSplash));
//     verify(mockSplashRepository.saveBool(tCheckfirstapp));
//   });
//
// }