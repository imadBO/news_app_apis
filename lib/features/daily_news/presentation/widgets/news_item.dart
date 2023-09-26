import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_apis/features/daily_news/presentation/views/webview_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishingDate,
  });

  final String? title;
  final String url;
  final String? urlToImage;
  final String publishingDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: url),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: urlToImage ?? '',
                  placeholder: (context, file) =>
                      Image.asset('assets/temp.jpg'),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/temp.jpg'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    publishingDate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
