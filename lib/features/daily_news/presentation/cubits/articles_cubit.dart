import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/core/constants.dart';
import 'package:news_app_apis/core/resources/app_strings_manager.dart';
import 'package:news_app_apis/core/resources/data_states.dart';
import 'package:news_app_apis/features/daily_news/domain/entities/article.dart';
import 'package:news_app_apis/features/daily_news/domain/use_cases/get_articles_usecase.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/articles_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit(this._getArticlesUseCase) : super(NewsInitialState()) {
    getArticles(
      {
        'endPoint': kHeadlinesEndpoint,
        'query': {
          'country': kCountry,
          'category': kBusinessNews,
          'apiKey': kApiKey,
        },
      },
      0,
    );
  }

  bool loading = false;
  List<ArticleEntity> businessNews = [];
  List<ArticleEntity> sportsNews = [];
  List<ArticleEntity> scienceNews = [];
  List<ArticleEntity> searchNews = [];
  late final GetArticlesUseCase _getArticlesUseCase;

  static NewsCubit get(context) => BlocProvider.of(context);

  void getArticles(Map<String, dynamic> query, int index) async {
    loading = !loading;
    emit(NewsFetchingLoadingState());
    final dataState = await _getArticlesUseCase.call(params: query);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      switch (index) {
        case 0:
          businessNews = dataState.data ?? [];
          break;
        case 1:
          sportsNews = dataState.data ?? [];
          break;
        case 2:
          scienceNews = dataState.data ?? [];
          break;
        case 3:
          searchNews = dataState.data ?? [];
          break;
      }
      loading = !loading;
      emit(NewsFetchedSuccessfullyState());
    } else {
      loading = !loading;
      if (dataState is DataFailed) {
        emit(
          NewsFetchingErrorState(
            dataState.exception!.message ?? AppStrings.defaultError,
          ),
        );
      } else {
        emit(
          NewsFetchingErrorState(
            dataState.error.toString(),
          ),
        );
      }
    }
  }

  // void fetchResults(Map<String, dynamic> callParams) async {
  //   loading = !loading;
  //   emit(SearchFetchingLoadingState());
  //   final dataState = await _getArticlesUseCase.call(params: callParams);
  //   if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
  //     searchResults = dataState.data ?? [];
  //     loading = !loading;
  //     emit(SearchFetchedSuccessfullyState());
  //   } else {
  //     loading = !loading;
  //     if (dataState is DataFailed) {
  //       emit(
  //         SearchFetchingErrorState(
  //           dataState.exception!.message ?? AppStrings.defaultError,
  //         ),
  //       );
  //     } else {
  //       emit(
  //         SearchFetchingErrorState(
  //           dataState.error.toString(),
  //         ),
  //       );
  //     }
  //   }
  // }
}
