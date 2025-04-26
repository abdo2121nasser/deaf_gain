part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class LoadingState extends SignInState {}

final class SuccessState extends SignInState {}

final class ErrorState extends SignInState {
  final ServerFailure error;
  ErrorState({required this.error}) {
    debugPrint(error.devMessage);
  }
}
final class SignInLoadingState extends LoadingState {}
final class SignInSuccessState extends SuccessState {}
final class SignInErrorState extends ErrorState {
  SignInErrorState({required super.error});
}



