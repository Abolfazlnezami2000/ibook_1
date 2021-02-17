// import 'package:flutter_app_clean_auth/features/authentication/data/models/authentication_model.dart';
// import 'package:flutter_app_clean_auth/features/authentication/domain/entities/authentication.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'dart:convert';
// import '../../../../fixtures/fixture_reader.dart';
//
// void main(){
//   final tAuthenticationModel = AuthenticationModel(token: "asd2134", refreshtoken: "asd2134", expiredtoken: DateTime.now());
//
//   test("should be subclass to Authentication entity", () async {
//     // arrange
//
//     // act
//     expect(tAuthenticationModel, isA<Authentication>());
//     // assert
//
//   });
//
//   group('tojson', (){
//     test("should change to json is true", () async {
//       // arrange
//
//       // act
//       final result = tAuthenticationModel.toJson();
//       // assert
//       final expextedMap ={
//         "token" : "asdasd1231",
//         "refreshtoken" : "asd2134",
//         "expiredtoken" : DateTime.now(),
//       };
//       expect(result, expextedMap);
//     });
//   });
//   group('fromjson', (){
//     test("should change to value is true", () async {
//       // arrange
//       final Map<String , dynamic> jsonMap = json.decode(fixture("authentication.json"));
//       // act
//       final result = AuthenticationModel.fromJson(jsonMap);
//       // assert
//       expect(result, tAuthenticationModel);
//     });
//   });
// }