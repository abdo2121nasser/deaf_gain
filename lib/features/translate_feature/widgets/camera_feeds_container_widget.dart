// lib/features/translate_feature/widgets/camera_feeds_container_widget.dart

import 'package:camera/camera.dart';
import 'package:deaf_gain/features/translate_feature/cubits/camera_cubit/camera_cubit.dart'
    as camera;
import 'package:deaf_gain/features/translate_feature/cubits/translate_cubit/translate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';

class CameraFeedsContainerWidget extends StatelessWidget {
  const CameraFeedsContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(k14R),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        color: kBackgroundColor, // placeholder until camera ready
        child: BlocBuilder<camera.CameraCubit, camera.CameraState>(
          builder: (context, state) {
            if (state is camera.LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is camera.ErrorState) {
              return const Center(
                  child: Text('لقد حدث قطاء ما حاول مره اخري!'));
            } else {
              return FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: state.controller!.value.previewSize!.height,
                  height: state.controller!.value.previewSize!.width,
                  child: CameraPreview(state.controller!),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
