import 'package:deaf_gain/core/utils/component/custom_full_input_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/services/validator_service.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';
import '../widgets/custom_email_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: k20H, vertical: k10V),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'اعاده تعيين كلمه المرور',
              style: TextStyle(
                  fontSize: k30Sp,
                  fontWeight: FontWeight.bold,
                  color: kDarkBlueColor),
            ),
            Form(
                key: _globalKey,
                child: CustomEmailWidget(
                  controller: _emailController,
                )),
            GeneralButtonWidget(
                label: 'اعاده تعيين كلمه السر',
                function: () {
                  if (_globalKey.currentState?.validate() ?? false) {
                    print(_emailController.text);
                  }
                },
                size: Size(double.maxFinite, k20V),
                textColor: kWhiteColor,
                backgroundColor: kDarkBlueColor,
                borderRadius: k10R)
          ],
        ),
      ),
    );
  }
}
