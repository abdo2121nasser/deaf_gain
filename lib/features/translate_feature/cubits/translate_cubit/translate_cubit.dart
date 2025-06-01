import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:deaf_gain/core/services/failure_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/component/toast_message_function.dart';
import '../../repositories/dio_stream_service.dart';
part 'translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit() : super(TranslateInitial());
  static TranslateCubit get(context) => BlocProvider.of(context);
  final DioStreamService _service = DioStreamService();

  StreamSubscription<String>? _msgSub;
  CameraController? _controller;

  int get translationSpeed => _service.timerSpeed;
  incrementTranslationSpeed() {
    _service.updateTimerSpeed(translationSpeed+50);
    emit(ChangeTranslationSpeedState());
  }

  decrementTranslationSpeed() {
    if(translationSpeed==0)return;
    _service.updateTimerSpeed(translationSpeed-50);

    emit(ChangeTranslationSpeedState());



  }

  Future<void> listenToConnection(CameraController controller) async {
    _controller = controller;
    emit(InitializeConnectionLoadingState());

    try {
      _msgSub = _service.messages.listen(
        (message) {
          if (!isClosed) {
            if (state is TranslateSuccessState) {
              message += (state as TranslateSuccessState).translatedText;
            }
            emit(TranslateSuccessState(translatedText: message));
          }
        },
        onError: (error) {
          if (!isClosed) {
            emit(TranslateErrorState(error: error.toString()));
          }
        },
      );

      if (!isClosed) {
        emit(ListenToConnectionSuccessState());
      }
    } on DioException catch (e) {
      final failure = ServerFailure.fromServer(e);
      showToastMessage(
        message: failure.userMessage,
      );
      emit(TranslateErrorState(error: failure.devMessage));
    } catch (e) {
      emit(TranslateErrorState(error: e.toString()));
    }
  }

  Future<void> startSending() async {
    if (_controller == null) {
      emit(TranslateErrorState(error: 'Camera not initialized'));
      return;
    }
    try {
      await _service.send(_controller!);
    } on DioException catch (e) {
      final failure = ServerFailure.fromServer(e);
      showToastMessage(
        message: failure.userMessage,
      );
      emit(TranslateErrorState(error: failure.devMessage));
    } catch (e) {
      emit(TranslateErrorState(error: e.toString()));
    }
  }

  Future<void> pauseSending() async {
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
