part of 'translate_cubit.dart';

@immutable
abstract class TranslateState {}

class TranslateInitial extends TranslateState {}

class InitializeConnectionLoadingState extends TranslateState {}
class ListenToConnectionSuccessState extends TranslateState {}


class TranslateSuccessState extends TranslateState {
  final String translatedText;
  TranslateSuccessState({required this.translatedText});
}

class TranslateErrorState extends TranslateState {
  final String error;
  TranslateErrorState({required this.error}){
    debugPrint(error);
  }
}

class TranslatePausedState extends TranslateState {}

class ChangeTranslationSpeedState extends TranslateState {}
class ChangePlayState extends TranslateState {}
