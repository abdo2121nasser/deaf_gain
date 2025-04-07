import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/features/authentication_feature/screens/authentication_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../configuration/routes.dart';

class DeafGainApp extends StatelessWidget {
  const DeafGainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => DevicePreview(
        enabled: true,
        builder: (context) => SafeArea(
          child: MaterialApp.router(
            locale: const Locale('ar'),
            // Always use Arabic
            supportedLocales: const [
              Locale('ar'), // Only Arabic supported
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              return const Locale('ar'); // Force Arabic locale
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            debugShowCheckedModeBanner: false,
            routerConfig: AppRoute.router,
            theme: ThemeData(scaffoldBackgroundColor: kBackgroundColor),
          ),
        ),
      ),
    );
  }
}
