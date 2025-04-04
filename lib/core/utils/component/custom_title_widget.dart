import 'package:flutter/cupertino.dart';

import '../colors/colors.dart';
import '../values/font_size.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;

  const CustomTitleWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: k30Sp,
          fontWeight: FontWeight.bold,
          color: kDarkBlueColor),
    );
  }
}
