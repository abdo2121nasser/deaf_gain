import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import '../widgets/custom_switch_widget.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: k20H, vertical: k10V),
        child: BlocProvider(
          create: (context) => AuthenticationSwitchCubit(),
          child:
          BlocBuilder<AuthenticationSwitchCubit, AuthenticationSwitchState>(
            builder: (context, state) {
              var h=MediaQuery.maybeOf(context)!.size.height;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: h*0.07,
                    ),
                    state.authenticationState.title,
                    SizedBox(
                      height:  h*0.07,
                    ),
                    CustomSwitchWidget(
                      isSignIn: state.isSignInState,
                    ),
                    SizedBox(
                      height:  h*0.04,
                    ),
                    state.authenticationState.form,
                    SizedBox(
                      height:  h*0.07,
                    ),
                    state.authenticationState.button,
                    SizedBox(
                      height:  h*0.04,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
