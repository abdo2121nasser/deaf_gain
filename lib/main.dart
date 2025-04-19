import 'package:bloc/bloc.dart';
import 'package:deaf_gain/root/app_root.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/services/bloc_opserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const DeafGainApp());
}
