import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as path;
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:flutter/services.dart';

class CashedImageWidget extends StatefulWidget {
  final String link;
  const CashedImageWidget({super.key, required this.link});

  @override
  State<CashedImageWidget> createState() => _CashedImageWidgetState();
}

class _CashedImageWidgetState extends State<CashedImageWidget> {
  String? _imagePath;
  String? _thumbnailPath;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _processFile();
  }

  Future<void> _processFile() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final cacheManager = DefaultCacheManager();
      final fileInfo = await cacheManager.getFileFromCache(widget.link);
      File file;

      if (fileInfo != null && fileInfo.file.existsSync()) {
        file = fileInfo.file;
      } else {
        file = await cacheManager.getSingleFile(widget.link);
      }

      final ext = path.extension(file.path).toLowerCase();
      if (_isImage(ext)) {
        setState(() => _imagePath = file.path);
      } else if (_isVideo(ext)) {
        await _generateVideoThumbnail(file);
      } else {
        debugPrint('Unsupported file type: $ext');
      }
    } catch (e, st) {
      debugPrint('Error in processing: $e\n$st');
      // On error, reset state and retry after a short delay:
      setState(() {
        _imagePath = null;
        _thumbnailPath = null;
      });
      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) _processFile();
    } finally {
      _isProcessing = false;
    }
  }

  Future<void> _generateVideoThumbnail(File videoFile) async {
    final thumbnailPath = '${videoFile.path}_thumb.jpg';

    try {
      await FFmpegKit.execute(
        '-i ${videoFile.path} -ss 00:00:01 -vframes 1 $thumbnailPath',
      );
      if (mounted) {
        setState(() => _thumbnailPath = thumbnailPath);
      }
    } on PlatformException catch (platformErr) {
      debugPrint('FFmpeg Session not found, retrying: $platformErr');
      // Reset and retry _processFile (not initState)
      await _reset();
    } catch (e) {
      debugPrint('FFmpeg error: $e');
    }
  }

  Future<void> _reset() async {
    setState(() {
      _imagePath = null;
      _thumbnailPath = null;
      _isProcessing=false;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) _processFile();
  }

  bool _isImage(String ext) =>
      ['.jpg', '.jpeg', '.png', '.gif', '.webp'].contains(ext);
  bool _isVideo(String ext) => ['.mp4', '.mov', '.avi', '.mkv'].contains(ext);

  @override
  Widget build(BuildContext context) {
    if (_thumbnailPath != null) {
      return Image.file(File(_thumbnailPath!), fit: BoxFit.cover);
    }
    if (_imagePath != null) {
      return Image.file(File(_imagePath!), fit: BoxFit.cover);
    }
    return const Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _isProcessing = false;
    super.dispose();
  }
}
