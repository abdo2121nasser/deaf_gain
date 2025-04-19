import 'package:deaf_gain/core/utils/component/custom_app_bar_widget.dart';
import 'package:deaf_gain/features/setting_feature/widgets/setting_screen_body_widget.dart';
import 'package:flutter/material.dart';



class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'الاعدادات'),
      body: SettingScreenBodyWidget(),
      
      
    );
  }
}
