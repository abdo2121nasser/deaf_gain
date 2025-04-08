import 'dart:io';

import 'package:deaf_gain/features/authentication_feature/screens/authentication_screen.dart';
import 'package:deaf_gain/features/authentication_feature/screens/forget_password_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const authenticationScreen = '/authentication-screen';
  static const forgetPasswordScreen = '/forget-password-screen';

  static final router =
      GoRouter(initialLocation: forgetPasswordScreen, routes: [
    GoRoute(
      path: authenticationScreen,
      builder: (context, state) => AuthenticationScreen(),
    ),
    GoRoute(
      path: forgetPasswordScreen,
      builder: (context, state) => ForgetPasswordScreen(),
    ),
  ]);
}
