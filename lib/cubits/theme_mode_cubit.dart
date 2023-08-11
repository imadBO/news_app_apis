import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/cubits/theme_mode_states.dart';
import 'package:news_app_apis/shared/cached_helper.dart';

class ThemeModeCubit extends Cubit<ThemeModeStates>{
  ThemeModeCubit():super(ThemeInitialState());

  bool isDark = CachedHelper.getData();

  static ThemeModeCubit get(context) => BlocProvider.of(context);

  void toggleMode(){
    isDark = !isDark;
    CachedHelper.putData(isDark);
    emit(ThemeChangedState());
  }
}