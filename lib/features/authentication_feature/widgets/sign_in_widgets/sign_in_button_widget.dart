import 'package:deaf_gain/core/utils/component/toast_message_function.dart';
import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/repositories/store_user_repository.dart';
import 'package:deaf_gain/features/authentication_feature/widgets/sign_in_widgets/sign_in_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../configuration/routes.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/general_button_widget.dart';
import '../../../../core/utils/values/app_size.dart';
import '../../models/sign_in_model.dart';

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
          return BlocConsumer<SignInCubit, SignInState>(
            listener: (BuildContext context, SignInState state) async {
              if (state is SignInSuccessState) {
                await StoreUserByHive().storeUser(userEntity: state.userEntity);
                AppRoute.router.pushReplacement(AppRoute.homeScreen);
              } else if (state is SignInErrorState) {
                showToastMessage(message: state.error.userMessage);
              }
            },
            builder: (signInCubitContext, signInCubitState) {
              if (signInCubitState is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GeneralButtonWidget(
                    label: 'تسجيل الدخول',
                    function: () {
                      if (formState.validateForm()||true) {
                        SignInCubit.get(authenticationContext).signIn(
                            signInModel: SignInModel(
                                email: formState.emailController.text,
                                password: formState.passwordController.text
                              // email: 'admin@deafassistant.com',
                              // password: 'Admin@123456'

                            ));
                        //todo undo the comments
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
