import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../entities/video_control_bar_entity.dart';

class VideoControlBarWidget extends StatelessWidget {
  final VideoControlBarEntity videoControlBarEntity;

  const VideoControlBarWidget({
    super.key,
    required this.videoControlBarEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: k14H),
        child: SizedBox(
          height: videoControlBarEntity.height,
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  videoControlBarEntity.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: kWhiteColor,
                ),
                onPressed: videoControlBarEntity.onPlayPause,
              ),
              // 👇 Make slider expandable
              Expanded(
                // fit: FlexFit.loose,
                child: Slider(
                  activeColor: kDarkBlueColor,
                  value: videoControlBarEntity.position.inMilliseconds
                      .clamp(0, videoControlBarEntity.duration.inMilliseconds)
                      .toDouble(),
                  max: videoControlBarEntity.duration.inMilliseconds.toDouble(),
                  onChanged: (ms) => videoControlBarEntity
                      .onSeek(Duration(milliseconds: ms.toInt())),
                ),
              ),
              Text(
                '${videoControlBarEntity.formatTime(videoControlBarEntity.position)} / ${videoControlBarEntity.formatTime(videoControlBarEntity.duration)}',
                style: const TextStyle(color: kWhiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
