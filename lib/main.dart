import 'package:bloc/bloc.dart';
import 'package:deaf_gain/root/app_root.dart';

import 'package:flutter/material.dart';
import 'core/services/bloc_opserver.dart';
import 'core/services/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();

  runApp(const DeafGainApp());
}
