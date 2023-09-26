import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/core/constants.dart';
import 'package:news_app_apis/core/resources/app_strings_manager.dart';
import 'package:news_app_apis/features/app_prefs/presentation/widgets/themes_icon.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/articles_cubit.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/articles_states.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/navigation_bar_cubit.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/navigation_bar_states.dart';
import 'package:news_app_apis/features/daily_news/presentation/views/search_screen.dart';
import 'package:news_app_apis/features/daily_news/presentation/widgets/business_page.dart';
import 'package:news_app_apis/features/daily_news/presentation/widgets/science_page.dart';
import 'package:news_app_apis/features/daily_news/presentation/widgets/sports_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const BusinessPage();
      case 1:
        return const SportsPage();
      case 2:
        return const SciencePage();
      default:
        return const SafeArea(
          child: Center(
            child: Text(AppStrings.defaultError),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBarCubit>(
      create: (BuildContext context) {
        return NavigationBarCubit();
      },
      child: BlocConsumer<NavigationBarCubit, NavigationBarStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          NavigationBarCubit navCubit = NavigationBarCubit.get(context);
          return BlocConsumer<NewsCubit, NewsStates>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              NewsCubit newsCubit = NewsCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: const Text(AppStrings.homeTitle),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.search),
                    ),
                    const ThemesIcon(),
                  ],
                ),
                body: _getPage(navCubit.index),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: navCubit.index,
                  onTap: (value) {
                    navCubit.updateIndex(value);
                    newsCubit.getArticles(
                      {
                        'endPoint': kHeadlinesEndpoint,
                        'query': {
                          'country': kCountry,
                          'category': value == 0
                              ? kBusinessNews
                              : value == 1
                                  ? kSportsNews
                                  : kScienceNews,
                          'apiKey': kApiKey,
                        },
                      },
                      value,
                    );
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business_center_outlined),
                      label: AppStrings.businessLabel,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.sports_gymnastics_outlined),
                      label: AppStrings.sportsLabel,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.science_outlined),
                      label: AppStrings.scienceLabel,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
