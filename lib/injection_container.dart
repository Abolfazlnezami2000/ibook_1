import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_app_clean_auth/features/authentication/data/data_sources/authentication_local_data_source.dart';
import 'package:flutter_app_clean_auth/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/repositories/repository_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/check_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/delete_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/find_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/save_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_app_clean_auth/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:flutter_app_clean_auth/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_app_clean_auth/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_app_clean_auth/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:flutter_app_clean_auth/features/register/data/repositories/register_repository_impl.dart';
import 'package:flutter_app_clean_auth/features/register/domain/repositories/register_repository.dart';
import 'package:flutter_app_clean_auth/features/register/domain/use_cases/register.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/login/domain/use_cases/login.dart';

final sl = GetIt.instance;


Future<void> init() async {
  await authenticationInjection();
  await loginInjection();
  await registerInjection();
}

Future<void> authenticationInjection() async {
  //! Features - Number Trivia
  // Bloc Authentication
  //! External Authentication
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //Data Source
  sl.registerLazySingleton<AuthenticationDataSources>(
          () => AuthenticationDataSourcesImpl(sharedPreferences: sl()));
  // Repository Authentication
  sl.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(dataSources: sl()));
  // Use cases Authentication
  sl.registerLazySingleton(() => CheckToken(sl()));
  sl.registerLazySingleton(() => SaveToken(sl()));
  sl.registerLazySingleton(() => DeleteToken(sl()));
  sl.registerLazySingleton(() => FindToken(sl()));
  // bloc
  sl.registerFactory(
    () => AuthenticationBloc(
      checkTokent: sl(),
      deleteToken: sl(),
      findToken: sl(),
      saveToken: sl(),
    ),
  );




}

Future<void> loginInjection() async {
  // core for all
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External for all
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  // Data Source Login
  sl.registerLazySingleton(
          () => LoginRemoteDataSourceImpl(client: sl()));
  // Repository Login
  sl.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  // Use cases Authentication
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  // Bloc Login
  sl.registerFactory(() => LoginBloc(login: sl(), authenticationBloc: sl()));

}

Future<void> registerInjection() async {
  // Bloc Register
  sl.registerFactory(() => RegisterBloc(register: sl()));
  // Use cases Register
  sl.registerLazySingleton(() => Register(sl()));
  //Repository Register
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  //Data Source Register
  sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(client: sl()));
}
