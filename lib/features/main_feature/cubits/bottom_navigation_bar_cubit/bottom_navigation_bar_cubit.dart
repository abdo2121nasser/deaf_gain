import 'package:deaf_gain/features/home_feature/screens/home_screen.dart';
import 'package:deaf_gain/features/translate_feature/screens/translate_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../history_feature/screens/history_screen.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(const HomeState(body: HomeScreen()));
  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);

  set setCurrentBodyWithIndex(int index) {
    switch (index) {
      case 0:
        emit(const HomeState(body: HomeScreen()));
        break;
      case 1:
        emit(const TranslateState(body: TranslateScreen()));
        break;
      // case 2:
      //   emit(const HistoryState(body: HistoryScreen()));
      //   break;
    }
  }

  int get setCurrentBodyWithIndex {
    switch (state) {
      case HomeState():
        return 0;
      case TranslateState():
        return 1;
      // case HistoryState():
      //   return 2;
    }
  }
}
