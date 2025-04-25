import 'dart:ui';

class VideoControlBarEntity {
  final double height;
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final Duration position;
  final Duration duration;
  final void Function(Duration) onSeek;
  final String Function(Duration) formatTime;

  const VideoControlBarEntity({
    required this.height,
    required this.isPlaying,
    required this.onPlayPause,
    required this.position,
    required this.duration,
    required this.onSeek,
    required this.formatTime,
  });
}
