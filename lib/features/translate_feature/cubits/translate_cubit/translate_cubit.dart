import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/failure_service.dart';
import '../../../../core/utils/strings/strings.dart';
import '../../../../core/services/web_socket_service.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
part 'translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit() : super(TranslateInitial());
  static TranslateCubit get(context) => BlocProvider.of(context);
  String _cumulativeText = '';
  final WebSocketService _service = WebSocketService();



  Future<void> connect() async {
    emit(InitializeWebSocketLoadingState());
    try {
      _service.connect();
      _service.messages.listen((message) {
        _cumulativeText += message;
            emit(TranslateSuccessState(translatedText: _cumulativeText));
      });

      if (!isClosed) {
        emit(InitializeWebSocketSuccessState());
      }
    } catch (e) {
      emit(InitializeWebSocketErrorState(message: e.toString()));
    }
  }

  Future<void> startStreaming({required CameraController controller}) async {
    if (!_service.isConnected || state is StopStreamingState) {
      emit(StreamingErrorState(message: 'Not connected to WebSocket'));
      return;
    }
    emit(StartStreamingState());

    await controller.startImageStream((CameraImage frame) async {
      if (_service.isConnected) {
        try {
          await _service.sendFrame(frame);
        } catch (e) {
          if (!isClosed) {
            emit(StreamingErrorState(message: 'Error sending frame: $e'));
          }
        }
      }
    });
  }

  Future<void> stopStreaming({required CameraController controller}) async {
    if(_service.isConnected) {
      await controller.stopImageStream();
      emit(StopStreamingState());

    }
  }

  @override
  close() async {
    await _service.disconnect();
    super.close();
  }
}
