import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/values/app_size.dart';
import 'cashed_image_widget.dart';

class ImageOfVideoContainerWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const ImageOfVideoContainerWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: constraints.maxWidth * 0.35,
      height: constraints.maxHeight,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          const CashedImageWidget(
            link: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          ),

          // Timestamp overlay
          Padding(
            padding: EdgeInsets.symmetric(horizontal: k5H,),
            child: const Text(
              '15:5',
              style:  TextStyle(
                color: kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
