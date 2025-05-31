// lib/repositories/translate_repository.dart

import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:deaf_gain/core/services/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:http_parser/http_parser.dart';

/// A repository responsible for sending one camera frame to the API
/// and returning the resulting String. All conversion + HTTP logic lives here.
class TranslateRepository {
  /// Public method: given a CameraImage, convert to JPEG and POST to "/translate-frame".
  /// Returns whatever String the server sends back (for example, a translated text).
  Future<String> sendFrame(CameraImage cameraImage) async {
    final Uint8List jpegBytes = _yuv420ToJpeg(cameraImage);
    final MultipartFile filePart = MultipartFile.fromBytes(
      jpegBytes,
      filename: 'frame.jpg',
      contentType: MediaType('image', 'jpeg'),
    );
    final formData = FormData.fromMap({'frame': filePart});

    try {
      final response = await DioHelper.postData(
        endPoint: 'translate',
        data: formData,
      );
      return response.data.toString();
    } catch (e) {
      throw Exception('TranslateRepository.sendFrame failed: $e');
    }
  }

  /// Converts YUV420 CameraImage → RGB → JPEG Uint8List (quality = 75).
  Uint8List _yuv420ToJpeg(CameraImage cameraImage) {
    final int width = cameraImage.width;
    final int height = cameraImage.height;
    final img.Image imgBuffer = img.Image(width: width, height: height);

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

        imgBuffer.setPixelRgba(x, y, r, g, b, 255);
      }
    }

    final List<int> jpegData = img.encodeJpg(imgBuffer, quality: 75);
    return Uint8List.fromList(jpegData);
  }
}
