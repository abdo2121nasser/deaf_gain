import 'package:bloc/bloc.dart';
import 'package:deaf_gain/features/translate_feature/screens/translate_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit()
      : super(const BottomNavigationBarInitial(body: TranslateScreen()));
  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);

  set currentBody(int index) {
    switch (index) {
      case 0:
        emit(const TranslateState(body: TranslateScreen()));
        break;
      case 1:
        emit(const HistoryState(body: SizedBox()));
        break;
    }
  }

  int get currentBody {
    switch (state) {
      case BottomNavigationBarInitial():
        return 0;
      case TranslateState():
        return 0;
      case HistoryState():
        return 1;
    }
  }
}
