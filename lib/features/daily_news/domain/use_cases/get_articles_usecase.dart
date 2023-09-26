import 'package:news_app_apis/core/resources/data_states.dart';
import 'package:news_app_apis/core/use_case/use_case.dart';
import 'package:news_app_apis/features/daily_news/domain/entities/article.dart';
import 'package:news_app_apis/features/daily_news/domain/repository/article_repository.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<ArticleEntity>>, Map<String, dynamic>> {
  final ArticleRepository _articleRepository;
  GetArticlesUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({
    Map<String, dynamic> params = const {},
  }) {
    return _articleRepository.getNewsArticles(params);
  }
}
