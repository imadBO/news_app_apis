import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/features/app_prefs/presentation/cubits/prefs_cubit.dart';
import 'package:news_app_apis/features/app_prefs/presentation/cubits/prefs_states.dart';

class ThemesIcon extends StatelessWidget {
  const ThemesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppPrefsCubit, AppPrefsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return IconButton(
          onPressed: () async {
            await AppPrefsCubit.get(context).toggleMode();
          },
          icon: const Icon(Icons.settings_brightness_outlined),
        );
      },
    );
  }
}
