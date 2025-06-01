import 'dart:async';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;

import '../models/prediction_entity.dart';

/// A service that:
///  1) Listens to the CameraController image stream and keeps the latest frame.
///  2) Every 100 ms, converts that latest frame → JPEG and POSTs it via Dio.
///  3) Exposes incoming String responses (from your API) as a Stream<String>.
class DioStreamService {
  final Dio _dio;
  final String url; // e.g. "http://YOUR_API_HOST:8000/predict"
  CameraController? _cameraController;
  CameraImage? _latestFrame;

  Timer? _timer;
  bool _sending = false;
  bool _isStreaming = false;

  final StreamController<String> _responseController =
      StreamController.broadcast();

  DioStreamService({required this.url})
      : _dio = Dio(BaseOptions(
          baseUrl: url,
          // connectTimeout: const Duration(seconds: 10),  // ✅ Increase timeout
          // receiveTimeout: const Duration(seconds: 10),

          headers: {'Content-Type': 'multipart/form-data'},
        ));

  /// Expose the stream of server‐sent String messages (prediction results).
  Stream<String> get messages => _responseController.stream;

  bool get isStreaming => _isStreaming;

  /// Call this once you have an initialized CameraController.
  /// This starts capturing frames and schedules HTTP posts every 100 ms.
  Future<void> start(CameraController controller) async {
    _cameraController = controller;
    _latestFrame = null;
    _isStreaming = true;

    // 1) Begin listening to camera frames (as fast as the camera provides).
    await _cameraController!.startImageStream((CameraImage frame) {
      _latestFrame = frame;
    });

    // 2) Every 100 ms, send the latest frame (if any) to the API.
    _timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (_) async {
        if (!_isStreaming) return;
        if (_latestFrame == null) return;
        if (_sending) return; // skip if a previous send is still in flight

        _sending = true;
        try {
          final jpegBytes = _convertCameraImageToJpeg(_latestFrame!);

          // Wrap bytes in a MultipartFile for Dio
          final formData = FormData.fromMap({
            'file': MultipartFile.fromBytes(
              jpegBytes,
              filename: 'frame.jpg',
              contentType: DioMediaType('image', 'jpeg'),
            ),
          });

          // Send POST to /predict
          final response = await _dio.post(
            '',
            data: formData,
            options: Options(responseType: ResponseType.json),
          );

          if (response.statusCode == 200 && response.data != null) {
            print('/////////////////////////////////////////////////');
            final PredictionModel predictionModel =
                PredictionModel.fromJson(response.data);
            print(predictionModel.toJson());
           if(containsNoEnglishLetters(predictionModel.arabic)){
             final display = "${predictionModel.arabic} ";
             _responseController.add(display);
           }

          } else {
            _responseController.add('Error: ${response.statusCode}');
          }
        } catch (e) {
          _responseController.add('Error: $e');
        } finally {
          _sending = false;
        }
      },
    );
  }

  Future<void> pause() async {
    _isStreaming = false;
    _timer?.cancel();
    _timer = null;
    _latestFrame = null;

    try {
      await _cameraController?.stopImageStream();
    } catch (_) {}
  }

  Future<void> dispose() async {
    await pause();
    _cameraController = null;
    await _responseController.close();
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


bool containsNoEnglishLetters(String input) {
  // Regex to check for any English letters
  final englishLetterRegExp = RegExp(r'[a-zA-Z]');
  // Returns false if any English letter found, true otherwise
  return !englishLetterRegExp.hasMatch(input);
}
