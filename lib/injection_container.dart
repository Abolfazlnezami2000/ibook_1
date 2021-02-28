import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_app_clean_auth/features/activation/data/repositories/activation_repository_impl.dart';
import 'package:flutter_app_clean_auth/features/activation/domain/repositories/activation_repository.dart';
import 'package:flutter_app_clean_auth/features/activation/domain/use_cases/send_code_activation.dart';
import 'package:flutter_app_clean_auth/features/activation/presentation/bloc/activation_bloc.dart';
import 'package:flutter_app_clean_auth/features/authentication/data/data_sources/authentication_remote_data_source.dart';
import 'package:flutter_app_clean_auth/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/repositories/repository_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/check_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/delete_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/find_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/save_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_app_clean_auth/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:flutter_app_clean_auth/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:flutter_app_clean_auth/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_app_clean_auth/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_app_clean_auth/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:flutter_app_clean_auth/features/register/data/repositories/register_repository_impl.dart';
import 'package:flutter_app_clean_auth/features/register/domain/repositories/register_repository.dart';
import 'package:flutter_app_clean_auth/features/register/domain/use_cases/register_usecase.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/activation/data/data_sources/activation_remote_data_source.dart';
import 'features/forget_password/data/data_sources/forget_password_local_data_source.dart';
import 'features/forget_password/data/repositories/forget_password_repository_impl.dart';
import 'features/forget_password/domain/repositories/forget_password_repository.dart';
import 'features/forget_password/domain/use_cases/change_password_forget_password.dart';
import 'features/forget_password/domain/use_cases/send_recovery_code_forget_password.dart';
import 'features/login/domain/use_cases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await authenticationInjection();
  await loginInjection();
  await registerInjection();
  await forgetPasswordInjection();
  await activationInjection();
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
      checkTokenForState: sl(),
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
  sl.registerLazySingleton(() => LoginRemoteDataSourceImpl(client: sl()));
  // Repository Login
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  // Use cases Authentication
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  // Bloc Login
  sl.registerFactory(() =>
      LoginBloc(login: sl(), authenticationBloc: sl<AuthenticationBloc>()));
}

Future<void> registerInjection() async {
  // Bloc Register
  sl.registerFactory(() => RegisterBloc(register: sl()));
  // Use cases Register
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  //Repository Register
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  //Data Source Register
  sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(client: sl()));
}

Future<void> forgetPasswordInjection() async {
  // Bloc Forgot Password
  sl.registerFactory(() => ForgetPasswordBloc(
      useCaseChangePassword: sl(), useCaseSendRecoveryCode: sl()));
  // Use Case Forgot Password
  sl.registerLazySingleton(() => SendRecoveryCodeUseCase(sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(sl()));
  // Repository Forgot Password
  sl.registerLazySingleton<ForgetPasswordRepository>(() =>
      ForgetPasswordRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  // Data Repository Forgot Password
  sl.registerLazySingleton(//can not add <ForgotPasswordRemoteDataSources>
      () => ForgetPasswordRemoteDataSourcesImpl(client: sl()));
}

Future<void> activationInjection() async {
  // Bloc Activation
  sl.registerFactory(() => ActivationBloc(usecase: sl()));
  // Use Case Activation
  sl.registerLazySingleton(() => SendCodeActivation(sl()));
  // Repository Activation
  sl.registerLazySingleton<ActivationRepository>(() =>
      ActivationRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  // Data Source
  sl.registerLazySingleton<ActivationRemoteDataSources>(
      () => ActivationRemoteDataSourcesImpl(client: sl()));
}
