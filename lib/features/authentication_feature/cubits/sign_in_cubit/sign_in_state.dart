part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class LoadingState extends SignInState {}

final class SuccessState extends SignInState {
  final UserEntity userEntity;

  SuccessState({required this.userEntity});
}

final class ErrorState extends SignInState {
  final ServerFailure error;
  ErrorState({required this.error}) {
    debugPrint(error.devMessage);
  }
}
final class SignInLoadingState extends LoadingState {}
final class SignInSuccessState extends SuccessState {
  SignInSuccessState({required super.userEntity});
}
final class SignInErrorState extends ErrorState {
  SignInErrorState({required super.error});
}



