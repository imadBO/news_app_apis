import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_apis/core/resources/data_states.dart';
import 'package:news_app_apis/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_apis/features/daily_news/data/models/article_model.dart';
import 'package:news_app_apis/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles(
    Map<String, dynamic> callParams,
  ) async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(callParams);
      if (httpResponse.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.requestOptions,
            error: httpResponse.statusMessage,
            type: DioExceptionType.badResponse,
            response: httpResponse,
          ),
        );
      }
    } catch (error) {
      if (error is DioException) {
        return DataFailed(error);
      } else {
        return FailedException(error);
      }
    }
  }
}
