import 'package:news_app_apis/core/enums/languages.dart';
import 'package:news_app_apis/features/app_prefs/data/data_sources/local/app_prefs_resolver.dart';
import 'package:news_app_apis/features/app_prefs/data/models/app_prefs_model.dart';
import 'package:news_app_apis/features/app_prefs/domain/repository/app_prefs_repository.dart';

class AppPrefsRepositoryImpl implements AppPrefsRepository {
  final AppPrefsResolver _appPrefsResolver;
  AppPrefsRepositoryImpl(this._appPrefsResolver);
  @override
  AppPrefsModel getAppPrefs() {
    bool theme = _appPrefsResolver.getAppTheme();
    String lang = _appPrefsResolver.getAppLanguage();

    return AppPrefsModel(lang: lang, isDark: theme);
  }

  @override
  Future<bool> setAppLang(Languages lang) async {
    return await _appPrefsResolver.setAppLang(lang);
  }

  @override
  Future<bool> setAppTheme(bool isDark) async {
    return await _appPrefsResolver.setAppTheme(isDark);
  }
}
