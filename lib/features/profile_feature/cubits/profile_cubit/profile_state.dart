part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {
}
final class LoadingState extends ProfileState {}
final class SuccessState extends ProfileState {
  final UserEntity userEntity;

  SuccessState({required this.userEntity});

}
final class ErrorState extends ProfileState {

}

final class GetUserDataLoadingState extends LoadingState {}
final class GetUserDataSuccessState extends SuccessState {

  GetUserDataSuccessState({required super.userEntity});
}
final class GetUserDataErrorState extends ErrorState {}

final class UpdateUserDataLoadingState extends LoadingState {}
final class UpdateUserDataSuccessState extends SuccessState {

  UpdateUserDataSuccessState({required super.userEntity});
}
final class UpdateUserDataErrorState extends ErrorState {}
