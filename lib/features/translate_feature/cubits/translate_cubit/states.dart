// part of 'translate_cubit.dart';
//
// @immutable
// sealed class TranslateState {
//   const TranslateState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// final class TranslateInitial extends TranslateState {}
//
// final class LoadingState extends TranslateState {}
//
// final class ErrorState extends TranslateState {
//   final String message;
//   ErrorState({required this.message}) {
//     ServerFailure(devMessage: message, userMessage: kUnKnownProblemMessage);
//   }
//   @override
//   List<Object?> get props => [message];
// }
//
// final class InitializeWebSocketLoadingState extends LoadingState {}
//
// final class InitializeWebSocketSuccessState extends TranslateState {}
//
// final class InitializeWebSocketErrorState extends ErrorState {
//   InitializeWebSocketErrorState({required super.message});
// }
//
// final class StartStreamingState extends LoadingState {}
//
// final class StreamingErrorState extends ErrorState {
//   StreamingErrorState({required super.message});
// }
//
// final class StopStreamingState extends TranslateState {}
// final class TranslateSuccessState extends TranslateState {
//   final String translatedText;
//   const TranslateSuccessState({required this.translatedText});
// }
