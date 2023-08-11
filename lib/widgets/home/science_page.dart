import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/cubits/news_cubit.dart';
import 'package:news_app_apis/cubits/news_states.dart';
import 'package:news_app_apis/widgets/shared_widgets/news_item.dart';

class SciencePage extends StatelessWidget {
  const SciencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return cubit.loading
            ? const Center(child: CircularProgressIndicator())
            : cubit.scienceNews.isEmpty
                ? const Center(child: Text('No news found'))
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return NewsItem(item: cubit.scienceNews[index]);
                    },
                    itemCount: cubit.scienceNews.length,
                  );
      },
    );
  }
}