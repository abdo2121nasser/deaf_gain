import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class CashedVideoWidget extends StatefulWidget {
  final String videoLink;
  final bool viewOnly;
  const CashedVideoWidget({
    super.key,
    required this.videoLink,
    this.viewOnly = false,
  });

  @override
  State<CashedVideoWidget> createState() => _CashedVideoWidgetState();
}

class _CashedVideoWidgetState extends State<CashedVideoWidget> {
  VideoPlayerController? _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<File> _getCachedFile() async {
    final cacheManager = DefaultCacheManager();
    final fileInfo = await cacheManager.getFileFromCache(widget.videoLink);
    if (fileInfo != null && fileInfo.file.existsSync()) {
      return fileInfo.file;
    }
    return await cacheManager.getSingleFile(widget.videoLink);
  }

  Future<void> _initialize() async {
    final file = await _getCachedFile();
    _controller = VideoPlayerController.file(file)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() => _loading = false);
        // Always pause on load to show first frame
        _controller!.pause();
      });
  }

  void _handleTap() {
    if (_controller == null || !_controller!.value.isInitialized) return;
    if (widget.viewOnly) return; // completely disable playback

    if (_controller!.value.isPlaying) {
      _controller!.pause();
    } else {
      // If at end, rewind to start
      if (_controller!.value.position >= _controller!.value.duration) {
        _controller!.seekTo(Duration.zero);
      }
      _controller!.play();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_loading || _controller == null || !_controller!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: _handleTap,
      child: VideoPlayer(_controller!),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
