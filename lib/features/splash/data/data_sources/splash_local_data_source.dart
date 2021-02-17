import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/features/splash/domain/entities/splash.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class SplashLocalDataSource {
  Future<Splash> getLastBool();
  Future<void> saveBool(Splash splashToCache);
}
const CACHED_SPLASH = 'CACHED_SPLASH';
class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final SharedPreferences sharedPreferences;

  SplashLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<Splash> getLastBool() {
    final jsonString = sharedPreferences.get(CACHED_SPLASH);
    if (jsonString != null) {
      return Future.value(Splash(checkfirstapp: jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void>saveBool(Splash splashToCache) {
    return sharedPreferences.setBool(
      CACHED_SPLASH, splashToCache.checkfirstapp
    );
  }
}