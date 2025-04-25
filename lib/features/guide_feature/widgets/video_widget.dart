import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../../../core/utils/values/app_size.dart';

class VideoWidget extends StatelessWidget {
  VideoWidget({
    super.key,
    required this.controller,
  });

  VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(k20R),
        child: VideoPlayer(controller));
  }
}
