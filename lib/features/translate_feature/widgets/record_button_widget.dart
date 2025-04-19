import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:flutter/material.dart';

class RecordButtonWidget extends StatefulWidget {
  const RecordButtonWidget({super.key});

  @override
  State<RecordButtonWidget> createState() => _RecordButtonWidgetState();
}

class _RecordButtonWidgetState extends State<RecordButtonWidget> {
  double _scale = 1.0;

  void _onTapDown(_) {
    setState(() {
      _scale = 1.2; // 120% size
    });
  }

  void _onTapUp(_) {
    setState(() {
      _scale = 1.0; // Return to normal
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: () {
          setState(() {
            _scale = 1.0;
          });
        },
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
