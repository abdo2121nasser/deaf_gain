import 'package:flutter/cupertino.dart';
import 'package:deaf_gain/core/utils/component/custom_title_widget.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/sign_in_widgets/sign_in_button_widget.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/sign_in_widgets/sign_in_form_widget.dart';

import '../widgets/authentication_title_widget.dart';
import '../widgets/sign_up_widgets/sign_up_button_widget.dart';
import '../widgets/sign_up_widgets/sign_up_form_widget.dart';

sealed class AuthenticationStateEntity {
  final Widget title;
  final Widget form;
  final Widget button;

  const AuthenticationStateEntity({
    required this.title,
    required this.form,
    required this.button,
  });
}

class SignInSwitchAuthenticationStateEntity extends AuthenticationStateEntity {
  SignInSwitchAuthenticationStateEntity()
      : super(
    title: const AuthenticationTitleWidget(isSignInScreen: true),
    form:  SignInFormWidget(),
    button: const SignInButtonWidget(),
  );
}

class SignUpSwitchAuthenticationStateEntity extends AuthenticationStateEntity {
  SignUpSwitchAuthenticationStateEntity()
      : super(
    title: const AuthenticationTitleWidget(isSignInScreen: false),
    form:  SignUpFormWidget(),
    button: const SignUpButtonWidget(),
  );
}

