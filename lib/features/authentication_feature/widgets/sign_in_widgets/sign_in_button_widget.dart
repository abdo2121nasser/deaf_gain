import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/models/sign_in_model.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/sign_in_widgets/sign_in_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/general_button_widget.dart';
import '../../../../core/utils/values/app_size.dart';
import '../../models/authentication_state.dart';

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationSwitchCubit, AuthenticationSwitchState>(
      builder: (context, state) {
        var formState = state.authenticationState.form as SignInFormWidget;
        return GeneralButtonWidget(
            label: 'تسجيل الدخول',
            function: () {
              if (formState.validateForm()) {
                print(SignInModel(
                        email: formState.emailController.text,
                        password: formState.passwordController.text)
                    .toJson());
              }
            },
            size: Size(double.maxFinite, k20V),
            textColor: kWhiteColor,
            backgroundColor: kDarkBlueColor,
            borderRadius: k10R);
      },
    );
  }
}
