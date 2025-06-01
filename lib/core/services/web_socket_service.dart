// lib/services/websocket_live_stream_service.dart

import 'dart:async';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

/// A service that keeps a single WebSocket connection open,
/// sends each frame (as JPEG bytes) over it, and exposes incoming
/// String messages from the server as a Stream<String>.
class WebSocketService {
  late final WebSocketChannel _channel;
  final StreamController<String> _responseController =
      StreamController.broadcast();

  Stream<String> get messages => _responseController.stream;

  WebSocketChannel get channel => _channel;
  bool get isConnected => _isConnected;

  bool _isConnected = false;


  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse('socketUrl'));
    _channel.stream.listen(
          (message) {
        if (message is String) {
          _responseController.add(message);
        }
      },
      onError: (error) {
        _isConnected = false;
      },
      onDone: () {
        _isConnected = false;
        _responseController.close();
      },
    );
    _isConnected = true;
  }

  Future<void> disconnect() async {
    if (_isConnected) {
      await _channel.sink.close(status.normalClosure);
      _isConnected = false;
      await _responseController.close();
    }
  }

  Future<void> sendFrame(CameraImage cameraImage) async {
    if (!_isConnected) {
      throw Exception('WebSocket is not connected');
    }

    final Uint8List jpegBytes = _yuv420ToJpeg(cameraImage);
    // Send binary data over WebSocket:
    _channel.sink.add(jpegBytes,);
  }

  /// Convert a YUV420 [CameraImage] → JPEG Uint8List (quality=75).
  Uint8List _yuv420ToJpeg(CameraImage cameraImage) {
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

    // Use top‐level helper to encode as JPEG:
    final List<int> jpegData = img.encodeJpg(buffer, quality: 75);
    return Uint8List.fromList(jpegData);
  }
}
