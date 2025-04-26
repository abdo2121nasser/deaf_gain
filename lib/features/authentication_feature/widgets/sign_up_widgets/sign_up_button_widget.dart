import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/models/sign_in_model.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/sign_up_widgets/sign_up_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/general_button_widget.dart';
import '../../../../core/utils/values/app_size.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocBuilder<AuthenticationSwitchCubit, AuthenticationSwitchState>(
        builder: (authenticationContext, authenticationCubitState) {
          var formState = authenticationCubitState.authenticationState.form
              as SignUpFormWidget;
          return BlocBuilder<SignUpCubit, SignUpState>(
            builder: (signUpContext, signUpState) {
              if (signUpState is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GeneralButtonWidget(
                    label: 'انشاء حساب',
                    function: () {
                      if (!formState.validateForm()) {
                        SignUpCubit.get(authenticationContext).signUp();
                        // print(SignInModel(
                        //     email: formState.emailController.text,
                        //     password: formState.passwordController.text)
                        //     .toJson());
                      }
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
