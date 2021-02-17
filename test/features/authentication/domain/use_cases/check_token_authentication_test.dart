import 'package:flutter_app_clean_auth/features/authentication/domain/repositories/repository_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/check_token_authentication.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository{}
void main(){
  MockAuthenticationRepository mockAuthenticationRepository;
   CheckToken checkToken;

   setUp((){
     mockAuthenticationRepository = MockAuthenticationRepository();
     checkToken = CheckToken(mockAuthenticationRepository);
   });

   test("should check run this func ", () async {
     // arrange

     // act

     // assert
      verify(mockAuthenticationRepository.checkToken());
   });

}