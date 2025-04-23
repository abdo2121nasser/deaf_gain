

import 'package:flutter/material.dart';

import '../../../core/utils/values/app_size.dart';
import 'cashed_image_widget.dart';

class ImageOfVideoWidget extends StatelessWidget {
  final BoxConstraints constraints;
  const ImageOfVideoWidget({
    super.key,
    required this.constraints
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(k8R),
        bottomLeft: Radius.circular(k8R),
      ), // or k20R
      child: SizedBox(
          width: constraints.maxWidth*0.35,
          height: constraints.maxHeight,
          child:
          const CashedImageWidget( link:  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')

      ),
    );
  }
}
