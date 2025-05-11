import 'dart:io';

import 'package:deaf_gain/features/authentication_feature/repositories/get_user_repository.dart';
import 'package:deaf_gain/features/authentication_feature/screens/authentication_screen.dart';
import 'package:deaf_gain/features/authentication_feature/screens/forget_password_screen.dart';
import 'package:deaf_gain/features/guide_feature/screens/guide_screen.dart';
import 'package:deaf_gain/features/main_feature/screens/main_screen.dart';
import 'package:deaf_gain/features/profile_feature/screens/profile_screen.dart';
import 'package:deaf_gain/features/setting_feature/screens/setting_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const authenticationScreen = '/authentication-screen';
  static const forgetPasswordScreen = '/forget-password-screen';
  static const homeScreen = '/home-screen';
  static const profileScreen = '/profile-screen';
  static const settingScreen = '/setting-screen';
  static const guideScreen = '/guide-screen';

  static final router = GoRouter(
      initialLocation:
          GetUserFromHive.isUserStored() ? homeScreen : authenticationScreen,
      routes: [
        GoRoute(
          path: authenticationScreen,
          builder: (context, state) => AuthenticationScreen(),
        ),
        GoRoute(
          path: forgetPasswordScreen,
          builder: (context, state) => ForgetPasswordScreen(),
        ),
        GoRoute(
          path: homeScreen,
          builder: (context, state) => MainScreen(),
        ),
        GoRoute(
          path: profileScreen,
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          path: settingScreen,
          builder: (context, state) => SettingScreen(),
        ),
        GoRoute(
          path: guideScreen,
          builder: (context, state) => GuideScreen(),
        ),
      ]);
}
