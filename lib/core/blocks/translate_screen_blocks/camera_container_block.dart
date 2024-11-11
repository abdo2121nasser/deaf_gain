import 'package:deaf_gain/core/blocks/translate_screen_blocks/widgets/recording_button_widget.dart';
import 'package:flutter/material.dart';

import '../../managers/values_manager.dart';

class CameraContainerBlock extends StatelessWidget {
  const CameraContainerBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.symmetric(
          horizontal: AppHorizontalSize.s14, vertical: AppVerticalSize.s14),
      width: double.maxFinite,
      height: MediaQuery.maybeOf(context)!.size.height * 0.4,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(AppRadiusSize.s14),
          border: Border.all(width: 2)),

    );
  }
}


