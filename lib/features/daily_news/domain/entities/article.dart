class ArticleEntity {
  final String url;
  final String urlToImage;
  final String title;
  final String publishingDate;

  const ArticleEntity({
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishingDate,
  });

  bool equalTo(ArticleEntity object) {
    return (url == object.url &&
        title == object.title &&
        urlToImage == object.urlToImage &&
        publishingDate == object.publishingDate);
  }
}
