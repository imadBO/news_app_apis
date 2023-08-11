import 'package:flutter/material.dart';
import 'package:news_app_apis/screens/webview_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.item});

  final Map item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: item['urlToImage'] != null
              ? DecorationImage(
                  image: NetworkImage(item['urlToImage']),
                  fit: BoxFit.cover,
                )
              : const DecorationImage(
                  image: AssetImage('assets/temp.jpg'),
                  fit: BoxFit.cover,
                ),
        ),
      ),
      title: Text(
        item['title'] ?? 'title',
        style: Theme.of(context).textTheme.bodyLarge,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        item['publishedAt'],
        style: const TextStyle(color: Colors.grey),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: item['url']),
          ),
        );
      },
    );
  }
}
