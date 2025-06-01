import 'package:deaf_gain/core/utils/component/toast_message_function.dart';
import 'package:deaf_gain/features/translate_feature/cubits/camera_cubit/camera_cubit.dart';
import 'package:deaf_gain/features/translate_feature/cubits/translate_cubit/translate_cubit.dart'
    as trans;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/strings/strings.dart';
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
        BlocProvider(create: (context) => trans.TranslateCubit()),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocListener<CameraCubit, CameraState>(
            listener: (context, state) {
              if (state is InitializeCameraSuccessState) {
                trans.TranslateCubit.get(context).initConnection(state.controller!);
              }
            },
            child: const CameraFeedsContainerWidget(),
          ),
          const HorizontalOptionsListWidget(),
          BlocConsumer<trans.TranslateCubit, trans.TranslateState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is trans.TranslateSuccessState) {
                return TranslatedTextContainerWidget(
                  translatedText: state.translatedText,
                );
              } else if (state is ErrorState) {
                return const TranslatedTextContainerWidget(
                  translatedText: 'حدث خطاء ما الرجتء اعاده المحاوله لاحقا',
                );
              } else {
                return const TranslatedTextContainerWidget(
                  translatedText: 'اضغط علي ذر التسجيل لبدء عمليه الترجمه',
                );
              }
            },
          ),
          BlocBuilder<CameraCubit, CameraState>(
            builder: (context, cameraState) {
              if (cameraState is InitializeCameraSuccessState) {
                return BlocConsumer<trans.TranslateCubit, trans.TranslateState>(
                  listener: (context, transState) {
                    if(transState is trans.TranslateErrorState){

                      showToastMessage(message: kUnKnownProblemMessage);
                    }
                  },
                  builder: (context, transState) {
                    if (transState is trans.TranslateErrorState
                    ) {
                      return RetryButtonWidget(
                          onTab: (){
                            trans.TranslateCubit.get(context).initConnection(cameraState.controller!);
                          });
                    }
                    else if(transState is trans.InitializeConnectionLoadingState){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    else {
                      return RecordButtonWidget(
                      );

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
