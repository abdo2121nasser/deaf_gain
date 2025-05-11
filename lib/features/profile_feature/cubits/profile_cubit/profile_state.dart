part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class LoadingState extends ProfileState {}
final class ErrorState extends ProfileState {

}

final class GetUserDataLoadingState extends LoadingState {}
final class GetUserDataSuccessState extends ProfileState {
  final UserEntity userEntity;

  GetUserDataSuccessState({required this.userEntity});
}
final class GetUserDataErrorState extends ErrorState {}
