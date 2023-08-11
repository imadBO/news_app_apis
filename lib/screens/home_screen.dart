import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/cubits/bottom_nav_cubit.dart';
import 'package:news_app_apis/cubits/bottom_nav_states.dart';
import 'package:news_app_apis/cubits/news_cubit.dart';
import 'package:news_app_apis/cubits/news_states.dart';
import 'package:news_app_apis/cubits/theme_mode_cubit.dart';
import 'package:news_app_apis/cubits/theme_mode_states.dart';
import 'package:news_app_apis/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavCubit>(
      create: (BuildContext context) => BottomNavCubit(),
      child: BlocConsumer<BottomNavCubit, BottomNavStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, BottomNavStates state) {
          BottomNavCubit navCubit = BottomNavCubit.get(context);
          return BlocConsumer<NewsCubit, NewsStates>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, NewsStates state) {
              NewsCubit newsCubit = NewsCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: const Text('News App'),
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
                    BlocConsumer<ThemeModeCubit, ThemeModeStates>(
                      listener: (BuildContext context, state) {},
                      builder: (BuildContext context, Object? state) {
                        return IconButton(
                          onPressed: () {
                            ThemeModeCubit.get(context).toggleMode();
                          },
                          icon:
                              const Icon(Icons.settings_brightness_outlined),
                        );
                      },
                    ),
                  ],
                ),
                body: navCubit.pages[navCubit.index],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: navCubit.index,
                  onTap: (value) {
                    navCubit.updateIndex(value);
                    newsCubit.getNews(
                      {
                        'country': 'us',
                        'category': value == 0
                            ? 'business'
                            : value == 1
                                ? 'sports'
                                : 'science',
                        'apiKey': 'd4b900204cdf42b38f0e5c30b8ac8303',
                      },
                      value,
                    );
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business_center_outlined),
                      label: 'Business',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.sports_gymnastics_outlined),
                      label: 'Sports',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.science_outlined),
                      label: 'Science',
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
