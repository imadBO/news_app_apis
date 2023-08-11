import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/cubits/bottom_nav_states.dart';
import 'package:news_app_apis/widgets/home/business_page.dart';
import 'package:news_app_apis/widgets/home/science_page.dart';
import 'package:news_app_apis/widgets/home/sports_page.dart';

class BottomNavCubit extends Cubit<BottomNavStates>{

  BottomNavCubit():super(BottomNavInitialState());

  List<Widget> pages = const [
    BusinessPage(),
    SportsPage(),
    SciencePage(),
  ];

  int index = 0;

  static BottomNavCubit get(context) => BlocProvider.of(context);

  void updateIndex(int value){
    index = value;
    emit(BottomNavUpdateIndexState());
  }
}