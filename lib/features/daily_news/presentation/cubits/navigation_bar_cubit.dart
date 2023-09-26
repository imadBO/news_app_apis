import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_apis/features/daily_news/presentation/cubits/navigation_bar_states.dart';

class NavigationBarCubit extends Cubit<NavigationBarStates> {
  NavigationBarCubit() : super(NavigationBarInitialState());

  List<Widget> pages = const [
    Center(child: Text('business news')),
    Center(child: Text('sports news')),
    Center(child: Text('science news')),
  ];

  int _currentIndex = 0;

  static NavigationBarCubit get(context) => BlocProvider.of(context);
  int get index => _currentIndex;

  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    emit(NavigationBarChangedState());
  }
}
