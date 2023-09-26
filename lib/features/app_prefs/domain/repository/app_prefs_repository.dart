import 'package:news_app_apis/core/enums/languages.dart';
import 'package:news_app_apis/features/app_prefs/domain/entities/app_prefs_entity.dart';

abstract class AppPrefsRepository {
  AppPrefsEntity getAppPrefs();
  Future<bool> setAppLang(Languages lang);
  Future<bool> setAppTheme(bool isDark);
}
