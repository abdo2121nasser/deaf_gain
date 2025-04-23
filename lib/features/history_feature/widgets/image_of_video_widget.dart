import 'package:deaf_gain/features/history_feature/widgets/video_cash_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/values/app_size.dart';

class ImageOfVideoWidget extends StatelessWidget {
  final num width;
  const ImageOfVideoWidget({
    super.key,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(k20R),
        bottomLeft: Radius.circular(k20R),
      ), // or k20R
      child: SizedBox(
          width: width.toDouble(),
          child:
          CashedVideoWidget(
            videoLink:
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            viewOnly: true,
          )
      ),
    );
  }
}
