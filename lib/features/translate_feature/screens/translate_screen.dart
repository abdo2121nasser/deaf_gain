import 'package:deaf_gain/features/translate_feature/cubits/camera_cubit/camera_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/camera_feeds_container_widget.dart';
import '../widgets/horizontal_options_list_widget.dart';
import '../widgets/record_button_widget.dart';
import '../widgets/translated_text_container_widget.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraCubit(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CameraFeedsContainerWidget(),
          HorizontalOptionsListWidget(),
          TranslatedTextContainerWidget(),
          RecordButtonWidget()
        ],
      ),
    );
  }
}

