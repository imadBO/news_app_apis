import 'package:news_app_apis/core/constants.dart';
import 'package:news_app_apis/core/enums/languages.dart';
import 'package:news_app_apis/core/extentions/languages_extension.dart';
import 'package:news_app_apis/core/helpers/cached_helper.dart';

class AppPrefsResolver {
  String getAppLanguage() {
    return CachedHelper.getData(kLangKey) ?? kEnglish;
  }

  bool getAppTheme() {
    return CachedHelper.getData(kDarkThemeKey) ?? false;
  }

  Future<bool> setAppLang(Languages lang) async {
    return await CachedHelper.putData(kLangKey, lang.getString());
  }

  Future<bool> setAppTheme(bool isDark) async {
    return await CachedHelper.putData(kDarkThemeKey, isDark);
  }
}
