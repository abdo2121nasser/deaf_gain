import 'dart:io';
import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/features/guide_feature/entities/video_control_bar_entity.dart';
import 'package:deaf_gain/features/guide_feature/widgets/video_control_bar_widget.dart';
import 'package:deaf_gain/features/guide_feature/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class DemoContainerWidget extends StatefulWidget {
  final String videoUrl;
  const DemoContainerWidget({
    super.key,
    required this.videoUrl,
  });

  @override
  _DemoContainerWidgetState createState() => _DemoContainerWidgetState();
}

class _DemoContainerWidgetState extends State<DemoContainerWidget> {
  late VideoPlayerController _controller;
  bool _initialized = false;
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    } else {
      final duration = _controller.value.duration;
      final position = _controller.value.position;
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: k10H),
          width: double.maxFinite,
          child: LayoutBuilder(builder: (context, constrain) {
            return Stack(
              children: [
                VideoWidget(controller: _controller),
                VideoControlBarWidget(
                    videoControlBarEntity: VideoControlBarEntity(
                  height: k50V,
                  isPlaying: _isPlaying,
                  onPlayPause: _togglePlayPause,
                  position: position,
                  duration: duration,
                  onSeek: (newPosition) => _controller.seekTo(newPosition),
                  formatTime: _format,
                )),
              ],
            );
          }),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  Future<void> _loadVideo() async {
    // 1️⃣ Try cache first
    final cacheMgr = DefaultCacheManager();
    final info = await cacheMgr.getFileFromCache(widget.videoUrl);
    File file;
    if (info != null && info.file.existsSync()) {
      file = info.file;
    } else {
      // 2️⃣ Otherwise stream + cache
      file = await cacheMgr.getSingleFile(widget.videoUrl);
    }

    // 3️⃣ Initialize controller
    _controller = VideoPlayerController.file(file)
      ..addListener(_onControllerUpdate)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() => _initialized = true);
      });
  }

  void _onControllerUpdate() {
    if (!mounted) return;
    setState(() {
      _isPlaying = _controller?.value.isPlaying ?? false;
    });
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  String _format(Duration d) {
    two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.inMinutes)}:${two(d.inSeconds % 60)}';
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    _controller.dispose();
    super.dispose();
  }
}
