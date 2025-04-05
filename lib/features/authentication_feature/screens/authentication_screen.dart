import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/general_button_widget.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:deaf_gain/features/authentication_feature/models/sign_in_model.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/authentication_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import '../widgets/custom_switch_widget.dart';
import '../widgets/sign_in_widgets/sign_in_button_widget.dart';
import '../widgets/sign_in_widgets/sign_in_form_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: k20H, vertical: k10V),
        child: BlocProvider(
          create: (context) => AuthenticationSwitchCubit(),
          child: BlocBuilder<AuthenticationSwitchCubit, AuthenticationSwitchState>(
  builder: (context, state) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              state.authenticationState.title,
               CustomSwitchWidget(
                isSignIn: state.isSignInState,
              ),
              state.authenticationState.form,
              state.authenticationState.button
            ],
          );
  },
),
        ),
      ),
    );
  }


}
