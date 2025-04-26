import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/sign_in_widgets/sign_in_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/general_button_widget.dart';
import '../../../../core/utils/values/app_size.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocBuilder<AuthenticationSwitchCubit, AuthenticationSwitchState>(
        builder: (authenticationContext, authenticationCubitState) {
          var formState = authenticationCubitState.authenticationState.form
              as SignInFormWidget;
          return BlocBuilder<SignInCubit, SignInState>(
            builder: (signInCubitContext, signInCubitState) {
              if (signInCubitState is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GeneralButtonWidget(
                    label: 'تسجيل الدخول',
                    function: () {
                      // if (formState.validateForm()) {
                      SignInCubit.get(authenticationContext).signIn();

                      // print(SignInModel(
                      //     email: formState.emailController.text,
                      //     password: formState.passwordController.text)
                      //     .toJson());
                      // AppRoute.router.pushReplacement(AppRoute.homeScreen);
                      // }
                    },
                    size: Size(double.maxFinite, k20V),
                    textColor: kWhiteColor,
                    backgroundColor: kDarkBlueColor,
                    borderRadius: k10R);
              }
            },
          );
        },
      ),
    );
  }
}
