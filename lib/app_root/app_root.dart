import 'package:deaf_gain/screens/home_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../screens/translate_screen.dart';

class DeafGainApp extends StatelessWidget {
  const DeafGainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) => SafeArea(
        child: ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            builder: (context, child) => GetMaterialApp(
                  locale:const Locale('ar'),
                  debugShowCheckedModeBanner: false,
                  home: TranslateScreen(),
                )),
      ),
    );
  }
}
