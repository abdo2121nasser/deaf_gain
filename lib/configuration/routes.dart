import 'dart:io';

import 'package:deaf_gain/features/authentication_feature/screens/authentication_screen.dart';
import 'package:go_router/go_router.dart';



class AppRoute {
  static const authenticationScreen = '/authentication-screen';


  static final router = GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        // final user = FirebaseAuth.instance.currentUser;
        // if (user != null && user.emailVerified) {
        //   return homeScreen;
        // } else {
        //   return signInScreen;
        // }
      },
      routes: [


       GoRoute(
          path: authenticationScreen,
          builder: (context, state) => const AuthenticationScreen(),
        ),
      ]);
}
