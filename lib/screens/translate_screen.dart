import 'package:deaf_gain/core/managers/values_manager.dart';
import 'package:flutter/material.dart';

import '../core/blocks/home_screen_blocks/app_bar_block.dart';
import '../core/blocks/translate_screen_blocks/camera_container_block.dart';
import '../core/blocks/translate_screen_blocks/widgets/recording_button_widget.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBlock(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CameraContainerBlock(),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: AppVerticalSize.s14),
            child: RecordingButtonWidget(),
          )
        ],
      ),
    );
  }
}
