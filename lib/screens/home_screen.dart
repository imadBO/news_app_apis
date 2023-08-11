import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/cubits/news_cubit.dart';
import 'package:news_app_apis/cubits/news_states.dart';
import 'package:news_app_apis/cubits/general_app_cubit.dart';
import 'package:news_app_apis/cubits/general_app_states.dart';
import 'package:news_app_apis/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralAppCubit, GeneralAppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, GeneralAppStates state) {
        GeneralAppCubit generalAppCubit = GeneralAppCubit.get(context);
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
                  IconButton(
                    onPressed: () {
                      generalAppCubit.toggleMode();
                    },
                    icon: const Icon(Icons.settings_brightness_outlined),
                  ),
                ],
              ),
              body: generalAppCubit.pages[generalAppCubit.index],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: generalAppCubit.index,
                onTap: (value) {
                  generalAppCubit.updateIndex(value);
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
    );
  }
}
