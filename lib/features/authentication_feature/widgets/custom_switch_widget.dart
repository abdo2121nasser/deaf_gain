import 'package:deaf_gain/features/authentication_feature/cubits/authentication_switch_cubit/authentication_switch_cubit.dart';
import 'package:deaf_gain/features/authentication_feature/models/authentication_state.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';

class CustomSwitchWidget extends StatelessWidget {
  final bool isSignIn;
  const CustomSwitchWidget({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.maybeOf(context)!.size.height * 0.07,
      decoration: BoxDecoration(
          color: kDarkBlueColor,
          borderRadius: BorderRadius.circular(k10R),
          border: Border.all(color: kDarkBlueColor, width: k1_5H)),
      child: Row(
        children: [
          // "إنشاء حساب" Button
          Expanded(
            child: InkWell(
              onTap: () {
                AuthenticationSwitchCubit.get(context)
                    .changeAuthenticationState(
                        authenticationState: SignUpSwitchAuthenticationState());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSignIn
                      ? kDarkBlueColor
                      : kWhiteColor, // Active button color
                  borderRadius: BorderRadius.circular(k10R),
                ),
                alignment: Alignment.center, // Center text inside the button
                child: Text(
                  'إنشاء حساب',
                  style: TextStyle(
                      fontSize: k16Sp,
                      color: isSignIn ? kWhiteColor : kDarkBlueColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),

          // "تسجيل الدخول" Button
          Expanded(
            child: InkWell(
              onTap: () {
                AuthenticationSwitchCubit.get(context)
                    .changeAuthenticationState(
                        authenticationState: SignInSwitchAuthenticationState());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSignIn
                      ? kWhiteColor
                      : kDarkBlueColor, // Inactive button color
                  borderRadius: BorderRadius.circular(k10R),
                ),
                alignment: Alignment.center,
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      fontSize: k16Sp,
                      color: isSignIn ? kDarkBlueColor : kWhiteColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
