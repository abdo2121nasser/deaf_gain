part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {
  UserEntity userEntity;
  ProfileInitial({required this.userEntity});
}
final class LoadingState extends ProfileState {}
final class ErrorState extends ProfileState {

}

final class UpdateUserDataLoadingState extends LoadingState {}
final class UpdateUserDataSuccessState extends ProfileState {
  final UserEntity userEntity;

  UpdateUserDataSuccessState({required this.userEntity});
}
final class UpdateUserDataErrorState extends ErrorState {}
