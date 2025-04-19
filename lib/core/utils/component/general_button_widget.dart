import 'package:flutter/material.dart';

import '../values/app_size.dart';
import '../values/font_size.dart';

class GeneralButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback function;
  final Size? size;
  final double borderRadius;
  final Color textColor, backgroundColor;
  final Icon? icon;

  const GeneralButtonWidget(
      {super.key,
      required this.label,
      required this.function,
      this.size,
      required this.textColor,
      required this.backgroundColor,
      required this.borderRadius,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: backgroundColor,
          fixedSize: size,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              label,
              style: TextStyle(fontSize: k16Sp, color: textColor),
            ),
            icon == null ?const SizedBox.shrink(): SizedBox(
              width: k10H,
            ),
            icon == null ? const SizedBox() : icon!,
          ],
        ));
  }
}
