// import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
// import 'package:flutter_app_clean_auth/features/authentication/domain/repositories/repository_authentication.dart';
// import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/save_token_authentication.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
//
// class MockAuthenticationRepository extends Mock implements AuthenticationRepository{}
// void main() {
//   MockAuthenticationRepository mockAuthenticationRepository;
//   SaveToken setToken;
//   setUp((){
//     mockAuthenticationRepository = MockAuthenticationRepository();
//     setToken = SaveToken(mockAuthenticationRepository);
//   });
//   final tToken = "a12b3d";
//   final trefreshToken = "a12b3d";
//   final texpiredToken = new DateTime.now();
//   final tAuthentication = Authentication(token: tToken,expiredToken: texpiredToken,refreshToken: trefreshToken);
//
//   test("should give token for set in cash is true",
//           () async {
//     // arrange
//     when(mockAuthenticationRepository.saveToken(any,any,any)).thenAnswer((_) async => Right(tAuthentication));
//     // act
//     final result = await setToken(Params(token: tToken,refreshToken: trefreshToken,expiredToken: texpiredToken));
//     // assert
//     expect(result, Right(tAuthentication));
//     verify(mockAuthenticationRepository.saveToken(tToken, trefreshToken, texpiredToken));
//
//   });
// }