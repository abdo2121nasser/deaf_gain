import 'package:deaf_gain/core/utils/component/custom_app_bar_widget.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:flutter/material.dart';

import '../widgets/demo_container_widget.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWidget(title: 'دليل الاستخدام'),
      body: Column(
        children: [
          DemoContainerWidget(
            videoUrl:
                'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          )
        ],
      ),
    );
  }
}
