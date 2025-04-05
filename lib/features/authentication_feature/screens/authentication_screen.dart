import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/general_button_widget.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:deaf_gain/features/authentication_feature/models/sign_in_model.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/authentication_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/custom_switch_widget.dart';
import '../widgets/sign_in_widgets/sign_in_button_widget.dart';
import '../widgets/sign_in_widgets/sign_in_form_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: k20H, vertical: k10V),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const AuthenticationTitleWidget(
              isSignInScreen: true,
            ),
            const CustomSwitchWidget(
              isSignIn: true,
            ),
            SignInFormWidget(
              globalKey: _globalKey,
              emailController: emailController,
              passwordController: passwordController,
            ),
            SignInButton(
              isValidData: () => isValidData(),
              signInModel: getSignInModel,
            )
          ],
        ),
      ),
    );
  }

  SignInModel getSignInModel() => SignInModel(
      email: emailController.text, password: passwordController.text);

  bool isValidData() => _globalKey.currentState?.validate() ?? false;
}
