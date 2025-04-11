part of 'bottom_navigation_bar_cubit.dart';

@immutable
sealed class BottomNavigationBarState {
  final Widget body;

  const BottomNavigationBarState({required this.body});

}

final class BottomNavigationBarInitial extends BottomNavigationBarState {
  const BottomNavigationBarInitial({required super.body});
}
final class TranslateState extends BottomNavigationBarState {
  const TranslateState({required super.body});
}final class HistoryState extends BottomNavigationBarState {
  const HistoryState({required super.body});
}
