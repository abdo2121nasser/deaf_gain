part of 'camera_cubit.dart';

@immutable
sealed class CameraState {
  CameraController? controller;
  CameraState({required this.controller});
}

final class InitialState extends CameraState {
  InitialState() : super(controller: null, );
}

final class LoadingState extends CameraState {
  LoadingState() : super(controller: null,);
}

final class SuccessState extends CameraState {
  SuccessState({required super.controller,});
}

final class ErrorState extends CameraState {
  final String error;
  ErrorState({required this.error})
      : super(controller: null,) {
    debugPrint(error);
  }
}

final class InitializeCameraLoadingState extends LoadingState {}

final class InitializeCameraSuccessState extends SuccessState {
  InitializeCameraSuccessState(
      {required super.controller});
}

final class InitializeCameraErrorState extends ErrorState {
  InitializeCameraErrorState({required super.error});
}
