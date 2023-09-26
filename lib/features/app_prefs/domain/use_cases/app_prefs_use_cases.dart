import 'package:news_app_apis/core/enums/languages.dart';
import 'package:news_app_apis/core/use_case/use_case.dart';
import 'package:news_app_apis/features/app_prefs/domain/entities/app_prefs_entity.dart';
import 'package:news_app_apis/features/app_prefs/domain/repository/app_prefs_repository.dart';

class GetAppPrefsUseCase implements UseCase<AppPrefsEntity, void> {
  final AppPrefsRepository _appPrefsRepository;
  GetAppPrefsUseCase(this._appPrefsRepository);
  @override
  Future<AppPrefsEntity> call({void params}) {
    Future(() => _appPrefsRepository.getAppPrefs());
    return Future(() => _appPrefsRepository.getAppPrefs());
  }
}

class SetAppLangUseCase implements UseCase<bool, Languages> {
  final AppPrefsRepository _appPrefsRepository;
  SetAppLangUseCase(this._appPrefsRepository);
  @override
  Future<bool> call({Languages params = Languages.english}) {
    return _appPrefsRepository.setAppLang(params);
  }
}

class SetAppThemeUseCase implements UseCase<bool, bool> {
  final AppPrefsRepository _appPrefsRepository;
  SetAppThemeUseCase(this._appPrefsRepository);
  @override
  Future<bool> call({bool params = false}) {
    return _appPrefsRepository.setAppTheme(params);
  }
}
