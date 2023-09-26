import 'package:get_it/get_it.dart';
import 'package:news_app_apis/features/app_prefs/data/data_sources/local/app_prefs_resolver.dart';
import 'package:news_app_apis/features/app_prefs/data/repository/app_prefs_repository_impl.dart';
import 'package:news_app_apis/features/app_prefs/domain/repository/app_prefs_repository.dart';
import 'package:news_app_apis/features/app_prefs/domain/use_cases/app_prefs_use_cases.dart';
import 'package:news_app_apis/features/app_prefs/presentation/cubits/prefs_cubit.dart';
import 'package:news_app_apis/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_apis/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_apis/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_apis/features/daily_news/domain/use_cases/get_articles_usecase.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/articles_cubit.dart';

final newsSl = GetIt.instance;
final prefsSl = GetIt.instance;
final getPrefsSl = GetIt.instance;
final setLangSl = GetIt.instance;
final setThemeSl = GetIt.instance;

Future<void> initializeDependencies() async {
  newsSl.registerSingleton<NewsApiService>(NewsApiService());
  newsSl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(newsSl()));
  newsSl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(newsSl()));
  newsSl.registerSingleton<NewsCubit>(NewsCubit(newsSl()));

  prefsSl.registerSingleton<AppPrefsResolver>(AppPrefsResolver());
  prefsSl
      .registerSingleton<AppPrefsRepository>(AppPrefsRepositoryImpl(prefsSl()));
  getPrefsSl
      .registerSingleton<GetAppPrefsUseCase>(GetAppPrefsUseCase(prefsSl()));
  setLangSl.registerSingleton<SetAppLangUseCase>(SetAppLangUseCase(prefsSl()));
  setThemeSl
      .registerSingleton<SetAppThemeUseCase>(SetAppThemeUseCase(prefsSl()));
  prefsSl.registerSingletonAsync<AppPrefsCubit>(
    () async {
      final cubit = AppPrefsCubit(
        getPrefsSl(),
        setLangSl(),
        setThemeSl(),
      );
      await cubit.getAppPrefs();
      return cubit;
    },
  );
}
