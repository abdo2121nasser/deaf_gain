import 'package:deaf_gain/core/utils/component/toast_message_function.dart';
import 'package:deaf_gain/features/translate_feature/cubits/camera_cubit/camera_cubit.dart';
import 'package:deaf_gain/features/translate_feature/cubits/out_put_type_cubit/out_put_type_cubit.dart';
import 'package:deaf_gain/features/translate_feature/cubits/translate_cubit/translate_cubit.dart';
import 'package:deaf_gain/features/translate_feature/enums/output_type_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/strings/strings.dart';
import '../../main_feature/widgets/tranlsation_speed_row_widget.dart';
import '../widgets/camera_feeds_container_widget.dart';
import '../widgets/horizontal_options_list_widget.dart';
import '../widgets/record_button_widget.dart';
import '../widgets/retry_button_widget.dart';
import '../widgets/translated_text_container_widget.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CameraCubit()..initializeCamera()),
        BlocProvider(create: (context) => TranslateCubit()),
        BlocProvider(create: (context) => OutPutTypeCubit()),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocListener<CameraCubit, CameraState>(
            listener: (context, state) {
              if (state is InitializeCameraSuccessState) {
                TranslateCubit.get(context)
                    .listenToConnection(state.controller!);
              }
            },
            child: const CameraFeedsContainerWidget(),
          ),
          const HorizontalOptionsListWidget(),
          const TranslationSpeedRowWidget(),
          BlocBuilder<OutPutTypeCubit, OutPutTypeState>(
            builder: (context, outPutTypeState) {
              if (outPutTypeState.outPutType == OutPutTypeEnum.text ||
                  outPutTypeState.outPutType == OutPutTypeEnum.both) {
                return BlocConsumer<TranslateCubit, TranslateState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is TranslateSuccessState) {
                      return TranslatedTextContainerWidget(
                        translatedText: state.translatedText,
                      );
                    } else if (state is ErrorState) {
                      return const TranslatedTextContainerWidget(
                        translatedText:
                            'حدث خطاء ما الرجتء اعاده المحاوله لاحقا',
                      );
                    } else {
                      return const TranslatedTextContainerWidget(
                        translatedText:
                            'اضغط علي ذر التسجيل لبدء عمليه الترجمه',
                      );
                    }
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          BlocBuilder<CameraCubit, CameraState>(
            builder: (context, cameraState) {
              if (cameraState is InitializeCameraSuccessState) {
                return BlocConsumer<TranslateCubit, TranslateState>(
                  listener: (context, transState) {
                    if (transState is TranslateErrorState) {
                      showToastMessage(message: kUnKnownProblemMessage);
                    }
                  },
                  builder: (context, transState) {
                    if (transState is TranslateErrorState) {
                      return RetryButtonWidget(onTab: () {
                        TranslateCubit.get(context)
                            .listenToConnection(cameraState.controller!);
                      });
                    } else if (transState is InitializeConnectionLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return RecordButtonWidget();
                    }
                  },
                );
              } else if (cameraState is InitializeCameraErrorState) {
                return RetryButtonWidget(
                  onTab: CameraCubit.get(context).initializeCamera,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
