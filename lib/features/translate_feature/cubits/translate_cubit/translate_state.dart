part of 'translate_cubit.dart';

@immutable
abstract class TranslateState {}

class TranslateInitial extends TranslateState {}

class InitializeConnectionLoadingState extends TranslateState {}

class TranslateStreamingState extends TranslateState {}

class TranslateSuccessState extends TranslateState {
  final String translatedText;
  TranslateSuccessState({required this.translatedText});
}

class TranslateErrorState extends TranslateState {
  final String message;
  TranslateErrorState({required this.message});
}

class TranslatePausedState extends TranslateState {}
class InitializeConnectionSuccessState extends TranslateState {}
