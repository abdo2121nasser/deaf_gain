import 'package:camera/camera.dart';
import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/features/translate_feature/cubits/translate_cubit/translate_cubit.dart';
import 'package:flutter/material.dart';

class RecordButtonWidget extends StatefulWidget {


  @override
  State<RecordButtonWidget> createState() => _RecordButtonWidgetState();
}

class _RecordButtonWidgetState extends State<RecordButtonWidget> {
  double _scale = 1.0;

  void _onTapDown(_) {
    setState(()  {
      _scale = 1.2; // 120% size
      TranslateCubit.get(context).startSending();
    });
  }

  void _onTapUp(_) {
    setState(()  {
      _scale = 1.0; // Return to normal
      TranslateCubit.get(context).pauseSending();

    });
  }
  void _onTapCancel() {
    setState(() {
      _scale = 1.0; // Return to normal
    });
    TranslateCubit.get(context).pauseSending();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,

        onTapCancel:_onTapCancel,
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: Container(
            padding: EdgeInsets.all(k20V),
            decoration: BoxDecoration(
              color: kRedColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: k10R,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Icon(
              Icons.circle,
              color: kWhiteColor,
              size: k20V,
            ),
          ),
        ),
      ),
    );
  }
}
