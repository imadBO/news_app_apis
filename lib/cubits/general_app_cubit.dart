import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/cubits/general_app_states.dart';
import 'package:news_app_apis/shared/cached_helper.dart';
import 'package:news_app_apis/widgets/home/business_page.dart';
import 'package:news_app_apis/widgets/home/science_page.dart';
import 'package:news_app_apis/widgets/home/sports_page.dart';

class GeneralAppCubit extends Cubit<GeneralAppStates>{
  GeneralAppCubit():super(ThemeInitialState());

  List<Widget> pages = const [
    BusinessPage(),
    SportsPage(),
    SciencePage(),
  ];

  int index = 0;
  bool isDark = CachedHelper.getData();

  static GeneralAppCubit get(context) => BlocProvider.of(context);

  void toggleMode(){
    isDark = !isDark;
    CachedHelper.putData(isDark);
    emit(ThemeChangedState());
  }

  void updateIndex(int value){
    index = value;
    emit(BottomNavUpdateIndexState());
  }
}