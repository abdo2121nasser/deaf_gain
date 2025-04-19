part of 'bottom_navigation_bar_cubit.dart';

@immutable
sealed class BottomNavigationBarState extends Equatable{
  final Widget body;

  const BottomNavigationBarState({required this.body});
  @override
  List<Object?> get props => [body];


}


final class HomeState extends BottomNavigationBarState {
  const HomeState({required super.body});
}final class TranslateState extends BottomNavigationBarState {
  const TranslateState({required super.body});
}

final class HistoryState extends BottomNavigationBarState {
  const HistoryState({required super.body});
}
