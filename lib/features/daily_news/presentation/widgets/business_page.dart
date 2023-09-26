import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/articles_cubit.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/articles_states.dart';
import 'package:news_app_apis/features/daily_news/presentation/widgets/news_item.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return cubit.loading
            ? const Center(child: CircularProgressIndicator())
            : cubit.businessNews.isEmpty
                ? const Center(child: Text('No news found'))
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return NewsItem(
                        title: cubit.businessNews[index].title,
                        url: cubit.businessNews[index].url,
                        urlToImage: cubit.businessNews[index].urlToImage,
                        publishingDate:
                            cubit.businessNews[index].publishingDate,
                      );
                    },
                    itemCount: cubit.businessNews.length,
                  );
      },
    );
  }
}
