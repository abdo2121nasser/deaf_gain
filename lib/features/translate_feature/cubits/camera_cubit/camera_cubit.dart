import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(InitialState());
  static CameraCubit get(context) => BlocProvider.of(context);

  Future<void> initializeCamera() async {
    try {
      emit(InitializeCameraLoadingState());
      CameraController cameraController;
      // Obtain list of the available cameras on the device.
      final List<CameraDescription> cameras = await availableCameras();
      // Use the first (rear) camera.
      final CameraDescription cameraDescription = cameras.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      cameraController = CameraController(
        cameraDescription,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await cameraController.initialize();
      if (!isClosed) {
        emit(InitializeCameraSuccessState(controller: cameraController));
      }
    } catch (error) {
      emit(InitializeCameraErrorState(error: error.toString()));
    }
  }

  @override
  Future<void> close() {
    if(state.controller!=null) {
      state.controller!.dispose();
    }
    return super.close();
  }
}
