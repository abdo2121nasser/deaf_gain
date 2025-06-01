import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/dio_stream_service.dart';
part 'translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit() : super(TranslateInitial());
  static TranslateCubit get(context) => BlocProvider.of(context);
  final DioStreamService _service =
      DioStreamService(url: 'http://127.0.0.1:5000/predict');

  StreamSubscription<String>? _msgSub;
  CameraController? _controller;

  Future<void> initConnection(CameraController controller) async {
    _controller = controller;
    emit(InitializeConnectionLoadingState());

    try {
      _msgSub = _service.messages.listen(
        (message) {
          if (!isClosed) {
            if(state is TranslateSuccessState) {
              message+= (state as TranslateSuccessState).translatedText;
            }
            emit(TranslateSuccessState(translatedText: message));
          }
        },
        onError: (error) {
          if (!isClosed) {
            emit(TranslateErrorState(message: error.toString()));
          }
        },
      );

      if (!isClosed) {
        emit(InitializeConnectionSuccessState());
      }
    } catch (e) {
      emit(TranslateErrorState(message: e.toString()));
    }
  }

  Future<void> startSending() async {
    if (_controller == null) {
      emit(TranslateErrorState(message: 'Camera not initialized'));
      return;
    }
    // emit(TranslateStreamingState());

    try {
      await _service.start(_controller!);
    } catch (e) {
      emit(TranslateErrorState(message: e.toString()));
    }
  }

  Future<void> pauseSending() async {
    // Only pause frame sending; keep the message listener alive
    await _service.pause();
    if (!isClosed) {
      emit(TranslatePausedState());
    }
  }

  @override
  Future<void> close() async {
    await _service.pause();
    await _msgSub?.cancel();
    _msgSub = null;
    await _service.dispose();
    return super.close();
  }
}
