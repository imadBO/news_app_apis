import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/cubits/news_states.dart';
import 'package:news_app_apis/shared/network/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState()) {
    getNews(
      {
        'country': 'us',
        'category': 'business',
        'apiKey': 'd4b900204cdf42b38f0e5c30b8ac8303',
      },
      0,
    );
  }

  bool loading = false;
  List businessNews = [];
  List sportsNews = [];
  List scienceNews = [];
  List searchNews = [];

  static NewsCubit get(context) => BlocProvider.of(context);

  Future<void> getNews(Map<String, dynamic> query, int index) async {
    loading = !loading;
    emit(NewsFetchingLoadingState());
    try {
      Response response;
      switch (index) {
        case 0:
          if (businessNews.isEmpty) {
            response = await DioHelper.getNews(query);
            businessNews = response.data['articles'];
          }
          break;
        case 1:
          if (sportsNews.isEmpty) {
            response = await DioHelper.getNews(query);
            sportsNews = response.data['articles'];
          }
          break;
        case 2:
          if (scienceNews.isEmpty) {
            response = await DioHelper.getNews(query);
            scienceNews = response.data['articles'];
          }
          break;
        case 3:
          response = await DioHelper.searchNews(query);
          searchNews = response.data['articles'];
          break;
      }
      loading = !loading;
      emit(NewsFetchedSuccessfullyState());
    } catch (error) {
      print('An error occurred while fetching news $error');
      loading = !loading;
      emit(NewsFetchingErrorState());
    }
  }
}
