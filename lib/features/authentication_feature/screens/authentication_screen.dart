import 'package:deaf_gain/core/services/validator_service.dart';
import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/custom_full_input_block.dart';
import 'package:deaf_gain/core/utils/component/custom_title_widget.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/custom_switch_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: k20H, vertical: k10V),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomTitleWidget(title: "تسجيل الدخول"),
            CustomSwitchWidget(
              isSignIn: false,
            ),
            Form(child: Column(
              children: [
                CustomFullInputBlock(
                    label: 'البريد الاليكتروني',
                    hint: 'ادخل بريدك الاليكتروني',
                    validator: ValidatorService.validateEmail,
                    color: kBlackColor,
                    enableBorder: true,
                    prefixIcon: const Icon(CupertinoIcons.envelope,color: kDarkBlueColor,),
                    controller: TextEditingController()),
                CustomFullInputBlock(
                    label: 'كلمه المرور',
                    hint: 'ادخل كلمه المرور',
                    validator: ValidatorService.validatePassword,
                    color: kBlackColor,
                    enableBorder: true,
                    prefixIcon: const Icon(CupertinoIcons.lock,color: kDarkBlueColor,),
                    controller: TextEditingController()),
              ],
            ))

          ],
        ),
      ),
    );
  }
}
