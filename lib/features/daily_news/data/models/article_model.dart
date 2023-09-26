import 'package:news_app_apis/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel({
    required super.title,
    required super.url,
    required super.urlToImage,
    required super.publishingDate,
  });

  factory ArticleModel.fromJSON(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title']??'',
      url: json['url']??'',
      urlToImage: json['urlToImage']??'',
      publishingDate: json['publishedAt']??'',
    );
  }
}
