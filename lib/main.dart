import 'package:bloc/bloc.dart';
import 'package:deaf_gain/core/services/dio_service.dart';
import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:deaf_gain/root/app_root.dart';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'core/services/bloc_opserver.dart';
import 'core/services/stripe_payment_services/api_keys_constants/apis_constants.dart';
import 'core/services/stripe_payment_services/service/stripe_dio_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/authentication_feature/entities/user_entity.dart';


Future<void> main() async {
 //  WidgetsFlutterBinding.ensureInitialized();
 //
 //  await speak('اهلا');
 // runApp(MaterialApp(home: Scaffold(),));
  Bloc.observer = MyBlocObserver();
  StripeDioHelper.init();
  DioHelper.init();
  Stripe.publishableKey = ApiKeysConst.stripePublishKey;

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox(kUsersBox);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const DeafGainApp());
}
Future<void> speak(String text) async {
  final FlutterTts _flutterTts = FlutterTts();

  await _flutterTts.awaitSpeakCompletion(true); // Wait for finish
  await _flutterTts.setLanguage("ar-EG");        // Arabic (Egypt)
  await _flutterTts.setPitch(1.0);               // Natural tone
  await _flutterTts.setSpeechRate(0.5);          // Clear speed

  // Optional: Check if language is supported
  bool? isLangAvailable = await _flutterTts.isLanguageAvailable("ar-EG");
  if (isLangAvailable != true) {
    print("ar-EG not available. Falling back to ar-SA");
    await _flutterTts.setLanguage("ar-SA"); // Fallback to Saudi dialect
  }
  print('4444444444444444444444444444444444444444444444444444444444444444444444444444444444444');
  await _flutterTts.speak(text);
}