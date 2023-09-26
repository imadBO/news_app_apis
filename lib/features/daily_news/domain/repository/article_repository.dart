import 'package:news_app_apis/core/resources/data_states.dart';
import 'package:news_app_apis/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles(
    Map<String, dynamic> callParams,
  );
}
