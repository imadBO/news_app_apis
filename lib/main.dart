import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/core/helpers/cached_helper.dart';
import 'package:news_app_apis/core/helpers/dio_helper.dart';
import 'package:news_app_apis/core/observer.dart';
import 'package:news_app_apis/core/resources/themes_manager.dart';
import 'package:news_app_apis/features/app_prefs/presentation/cubits/prefs_cubit.dart';
import 'package:news_app_apis/features/app_prefs/presentation/cubits/prefs_states.dart';
import 'package:news_app_apis/injection_container.dart';

import 'features/daily_news/presentation/cubits/articles_cubit.dart';
import 'features/daily_news/presentation/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachedHelper.init();
  Bloc.observer = MyBlocObserver();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => prefsSl<AppPrefsCubit>(),
        ),
        BlocProvider(
          create: (BuildContext context) => newsSl<NewsCubit>(),
        ),
      ],
      child: BlocConsumer<AppPrefsCubit, AppPrefsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          AppPrefsCubit cubit = AppPrefsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemesManager.lightTheme,
            darkTheme: ThemesManager.darkTheme,
            themeMode: cubit.appPrefs.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
