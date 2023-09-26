import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/core/enums/languages.dart';
import 'package:news_app_apis/core/extentions/languages_extension.dart';
import 'package:news_app_apis/features/app_prefs/domain/entities/app_prefs_entity.dart';
import 'package:news_app_apis/features/app_prefs/domain/use_cases/app_prefs_use_cases.dart';
import 'package:news_app_apis/features/app_prefs/presentation/cubits/prefs_states.dart';

class AppPrefsCubit extends Cubit<AppPrefsStates> {
  final GetAppPrefsUseCase _getAppPrefsUseCase;
  final SetAppLangUseCase _setAppLangUseCase;
  final SetAppThemeUseCase _setAppThemeUseCase;
  AppPrefsCubit(
    this._getAppPrefsUseCase,
    this._setAppLangUseCase,
    this._setAppThemeUseCase,
  ) : super(PrefsInitialState());

  late AppPrefsEntity appPrefs;

  static AppPrefsCubit get(context) => BlocProvider.of(context);

  Future<void> getAppPrefs() async {
    appPrefs = await _getAppPrefsUseCase.call();
    emit(PrefsResolvedState());
  }

  Future<void> toggleMode() async {
    final newTheme = !appPrefs.isDark;
    bool isSet = await _setAppThemeUseCase.call(params: newTheme);
    if (isSet) {
      appPrefs.isDark = newTheme;
      emit(ThemeChangedState());
    } else {
      emit(ThemeErrorState());
    }
  }

  Future<void> changeLanguage(Languages lang) async {
    bool isSet = await _setAppLangUseCase.call(params: lang);
    if (isSet) {
      appPrefs.lang = lang.getString();
      emit(LanguageChangedState());
    } else {
      emit(LanguageErrorState());
    }
  }
}
