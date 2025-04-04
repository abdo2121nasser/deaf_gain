

import 'package:deaf_gain/features/authentication_feature/models/sign_in_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/general_button_widget.dart';
import '../../../../core/utils/values/app_size.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,required this.isValidData,
    required this.signInModel
  });
  final bool Function() isValidData;
  final SignInModel Function() signInModel;

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: 'تسجيل الدخول',
        function: (){
          if(isValidData()){
            print(signInModel().toJson());
          }
        },
        size: Size(double.maxFinite, k20V),
        textColor: kWhiteColor,
        backgroundColor: kDarkBlueColor,

        borderRadius: k10R);
  }
}

