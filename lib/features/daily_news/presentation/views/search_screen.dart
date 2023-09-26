import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/core/constants.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/articles_cubit.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/articles_states.dart';
import 'package:news_app_apis/features/daily_news/presentation/widgets/custom_form_field.dart';
import 'package:news_app_apis/features/daily_news/presentation/widgets/news_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: CustomFormField(
                        label: 'Search',
                        controller: searchController,
                        type: TextInputType.text,
                        prefixIcon: Icons.search,
                        validator: (String? value) =>
                            value!.isEmpty ? 'search must not be empty' : null,
                        onChanged: (String value) {
                          cubit.getArticles(
                            {
                              'endPoint': kSearchNewsEndpoint,
                              'query': {
                                'q': value,
                                'apiKey': 'd4b900204cdf42b38f0e5c30b8ac8303',
                              },
                            },
                            3,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                cubit.loading
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : cubit.searchNews.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                'Type somethinng',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return NewsItem(
                                  title: cubit.searchNews[index].title,
                                  url: cubit.searchNews[index].url,
                                  urlToImage:
                                      cubit.searchNews[index].urlToImage,
                                  publishingDate:
                                      cubit.searchNews[index].publishingDate,
                                );
                              },
                              itemCount: cubit.searchNews.length,
                            ),
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}
