import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/features/authentication_feature/screens/authentication_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../configuration/routes.dart';

final themeNotifier = ThemeNotifier();

class DeafGainApp extends StatelessWidget {
  const DeafGainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => DevicePreview(
            enabled: true,
            builder: (context) => SafeArea(
              child: MaterialApp.router(
                locale: const Locale('ar'),
                supportedLocales: const [Locale('ar')],
                localeResolutionCallback: (locale, supportedLocales) => const Locale('ar'),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                routerConfig: AppRoute.router,
                theme: _getLightTheme,
                darkTheme: _getDarkMaterialTheme,
                themeMode: mode,
              ),
            ),
          ),
        );
      },
    );
  }

  ThemeData get _getLightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: kBackgroundColor,
      drawerTheme: const DrawerThemeData(backgroundColor: kBackgroundColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: kDarkBlueColor,
        selectedItemColor: kWhiteColor,
        unselectedItemColor: kGreyColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(color: kDarkBlueColor),
      ),
    );
  }

  ThemeData get _getDarkMaterialTheme {
    return ThemeData(
      brightness: Brightness.dark,
      // scaffoldBackgroundColor: Colors.black,
      drawerTheme: const DrawerThemeData(backgroundColor: kBlackColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: kDarkBlueColor,
        selectedItemColor: kBlackColor,
        unselectedItemColor: kGreyColor,
      ),
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: Colors.black,
      //   iconTheme: IconThemeData(color: Colors.white),
      // ),
    );
  }
}
class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
