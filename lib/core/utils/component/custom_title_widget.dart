import 'package:flutter/cupertino.dart';

import '../colors/colors.dart';
import '../values/font_size.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomTitleWidget({required this.title, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: k30Sp, fontWeight: FontWeight.bold, color: kBlackColor),
        ),

      ],
    );
  }
}
