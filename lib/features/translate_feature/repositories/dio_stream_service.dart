import 'dart:async';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as img;

import '../../../core/services/failure_service.dart';
import '../../../core/utils/component/toast_message_function.dart';
import '../models/prediction_entity.dart';

class DioStreamService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://127.0.0.1:5000/predict',
    // connectTimeout: const Duration(seconds: 10),  // ✅ Increase timeout
    // receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'multipart/form-data'},
  ));
  CameraController? _cameraController;
  CameraImage? _latestFrame;
  Timer? _timer;
  bool _sending = false;
  bool _isStreaming = false;
  int _timerSpeed = 100;

  final StreamController<String> _responseController =
      StreamController.broadcast();

  Stream<String> get messages => _responseController.stream;
  bool get isStreaming => _isStreaming;
  int get timerSpeed => _timerSpeed;

  Future<void> send(CameraController controller) async {
    if (_isStreaming) return;
    _cameraController = controller;
    _latestFrame = null;
    _isStreaming = true;
    await _cameraController!.startImageStream((CameraImage frame) {
      _latestFrame = frame;
    });
    _timer = Timer.periodic(Duration(milliseconds: _timerSpeed), (_) async {
      await _sendFrames();
    });
  }

  Future<void> pause() async {
    if (!_isStreaming) return;
    _isStreaming = false;
    _timer?.cancel();
    _timer = null;
    _latestFrame = null;

    try {
      await _cameraController?.stopImageStream();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> dispose() async {
    await pause();
    _cameraController = null;
    await _responseController.close();
  }

  Future<void> _sendFrames() async {
    if (!_isStreaming) return;
    if (_latestFrame == null) return;
    if (_sending) return;
    _sending = true;
    try {
      final jpegBytes = _convertCameraImageToJpeg(_latestFrame!);
      Response response = await _sendRequests(jpegBytes);
      if (response.statusCode == 200 && response.data != null) {
        final PredictionModel predictionModel =
            PredictionModel.fromJson(response.data);
        final display = "${predictionModel.arabic} ";
        _responseController.add(display);
      }
    } on DioException catch (e) {
      final failure = ServerFailure.fromServer(e);
      debugPrint(failure.devMessage);
      showToastMessage(
        message: failure.userMessage,
      );
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _sending = false;
    }
  }

  Future<Response> _sendRequests(Uint8List jpegBytes) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        jpegBytes,
        filename: 'frame.jpg',
        contentType: DioMediaType('image', 'jpeg'),
      ),
    });
    return await _dio.post(
      '',
      data: formData,
      options: Options(responseType: ResponseType.json),
    );
  }

  void updateTimerSpeed(int newSpeedMs) {
    _timerSpeed = newSpeedMs;
    if (_isStreaming) {
      _timer?.cancel();
      _timer = Timer.periodic(
        Duration(milliseconds: _timerSpeed),
            (_) async => await _sendFrames(),
      );
    }
  }
  Uint8List _convertCameraImageToJpeg(CameraImage cameraImage) {
    final int width = cameraImage.width;
    final int height = cameraImage.height;
    final img.Image buffer = img.Image(width: width, height: height);

    final Plane yPlane = cameraImage.planes[0];
    final Plane uPlane = cameraImage.planes[1];
    final Plane vPlane = cameraImage.planes[2];

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final int uvIndex =
            (y ~/ 2) * uPlane.bytesPerRow + (x ~/ 2) * uPlane.bytesPerPixel!;
        final int yIndex = y * yPlane.bytesPerRow + x;

        final int Y = yPlane.bytes[yIndex] & 0xFF;
        final int U = uPlane.bytes[uvIndex] & 0xFF;
        final int V = vPlane.bytes[uvIndex] & 0xFF;

        int r = (Y + (1.370705 * (V - 128))).round();
        int g = (Y - (0.337633 * (U - 128)) - (0.698001 * (V - 128))).round();
        int b = (Y + (1.732446 * (U - 128))).round();

        r = r.clamp(0, 255);
        g = g.clamp(0, 255);
        b = b.clamp(0, 255);

        buffer.setPixelRgba(x, y, r, g, b, 255);
      }
    }

    final List<int> jpegData = img.encodeJpg(buffer, quality: 75);
    return Uint8List.fromList(jpegData);
  }
}

// bool containsNoEnglishLetters(String input) {
//   // Regex to check for any English letters
//   final englishLetterRegExp = RegExp(r'[a-zA-Z]');
//   // Returns false if any English letter found, true otherwise
//   return !englishLetterRegExp.hasMatch(input);
// }
