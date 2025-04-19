import 'package:deaf_gain/core/utils/component/custom_app_bar_widget.dart';
import 'package:deaf_gain/features/profile_feature/widgets/profile_screen_body_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'الحساب الشخصي'),
      body:ProfileScreenBodyWidget() ,
    );
  }
}
