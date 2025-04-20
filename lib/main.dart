import 'package:bloc/bloc.dart';
import 'package:deaf_gain/root/app_root.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'core/services/bloc_opserver.dart';
import 'core/services/stripe_payment_services/api_keys_constants/apis_constants.dart';
import 'core/services/stripe_payment_services/service/stripe_dio_service.dart';


Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  StripeDioHelper.init();
  Stripe.publishableKey = ApiKeysConst.stripePublishKey;

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const DeafGainApp());
}
