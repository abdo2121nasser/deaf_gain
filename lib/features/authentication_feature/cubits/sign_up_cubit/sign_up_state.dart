part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}


final class LoadingState extends SignUpState {}

final class SuccessState extends SignUpState {}

final class ErrorState extends SignUpState {
  final ServerFailure error;
  ErrorState({required this.error}) {
    debugPrint(error.devMessage);
  }
}
final class SignUpLoadingState extends LoadingState {}
final class SignUpSuccessState extends SuccessState {}
final class SignUpErrorState extends ErrorState {
  SignUpErrorState({required super.error});
}

