import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';



class AuthenticationTitleWidget extends StatelessWidget {
  const AuthenticationTitleWidget({super.key,required this.isSignInScreen});
 final bool isSignInScreen;
  @override
  Widget build(BuildContext context) {
    return Text(
      isSignInScreen?'تسجيل الدخول': 'انشاء حساب',
      style: TextStyle(
          fontSize: k30Sp,
          fontWeight: FontWeight.bold,
          color: kDarkBlueColor),
    );
  }
}
