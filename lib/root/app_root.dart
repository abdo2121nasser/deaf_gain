import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        // enabled: true,
        builder: (context) => SafeArea(
          child: MaterialApp.router(
            locale: const Locale('ar'),
            debugShowCheckedModeBanner: false,
            // builder: DevicePreview.appBuilder,
            routerConfig: AppRoute.router,
          ),
        ),
      ),
    );
  }
}
