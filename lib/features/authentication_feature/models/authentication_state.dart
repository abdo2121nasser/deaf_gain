import 'package:flutter/cupertino.dart';
import 'package:deaf_gain/core/utils/component/custom_title_widget.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/sign_in_widgets/sign_in_button_widget.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/sign_in_widgets/sign_in_form_widget.dart';

import '../widgets/authentication_title_widget.dart';
import '../widgets/sign_up_widgets/sign_up_button_widget.dart';
import '../widgets/sign_up_widgets/sign_up_form_widget.dart';

sealed class AuthenticationState {
  final Widget title;
  final Widget form;
  final Widget button;

  const AuthenticationState({
    required this.title,
    required this.form,
    required this.button,
  });
}

class SignInSwitchAuthenticationState extends AuthenticationState {
  SignInSwitchAuthenticationState()
      : super(
    title: const AuthenticationTitleWidget(isSignInScreen: true),
    form:  SignInFormWidget(),
    button: const SignInButtonWidget(),
  );
}

class SignUpSwitchAuthenticationState extends AuthenticationState {
  SignUpSwitchAuthenticationState()
      : super(
    title: const AuthenticationTitleWidget(isSignInScreen: false),
    form:  SignUpFormWidget(),
    button: const SignUpButtonWidget(),
  );
}

// SwitchModel signInSwitchModel = SwitchModel(
//     currentTitle: const AuthenticationTitleWidget(
//       isSignInScreen: true,
//     ),
//     currentForm: SignInFormWidget(),
//     currentButton: const SignInButtonWidget());
//
// SwitchModel signUpSwitchModel = SwitchModel(
//     currentTitle: const AuthenticationTitleWidget(
//       isSignInScreen: false,
//     ),
//     currentForm: SignUpFormWidget(),
//     currentButton:  const SignUpButtonWidget());
