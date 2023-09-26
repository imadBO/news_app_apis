import 'package:dio/dio.dart';
import 'package:news_app_apis/core/helpers/dio_helper.dart';
import 'package:news_app_apis/features/daily_news/data/models/article_model.dart';

class NewsApiService {
  Future<Response> getNewsArticles(Map<String, dynamic> callParams) async {
    Response response;
    response = await DioHelper.getNews(
      callParams['query'],
      callParams['endPoint'],
    );
    List<ArticleModel> articles = [];
    response.data['articles'].map((article) {
      articles.add(ArticleModel.fromJSON(article));
    }).toList();

    var httpResponse = Response(
      requestOptions: response.requestOptions,
      data: articles,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
    return httpResponse;
  }
}
