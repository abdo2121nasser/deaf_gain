

import 'package:flutter/cupertino.dart';

import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/general_button_widget.dart';
import '../../../../core/utils/values/app_size.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: 'تسجيل الدخول',
        function: (){},
        size: Size(double.maxFinite, k20V),
        textColor: kWhiteColor,
        backgroundColor: kDarkBlueColor,

        borderRadius: k10R);
  }
}

