


import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';

class TranslatedTextContainerWidget extends StatelessWidget {
  final String translatedText;
  const TranslatedTextContainerWidget({
    super.key,
    required this.translatedText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: k16H, vertical: k12V),
      width: double.maxFinite,
      height: MediaQuery.maybeOf(context)!.size.height * 0.2,
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(k20R)),
      child: SingleChildScrollView(
        child: Text(translatedText,

          style: TextStyle(
              color: kBlackColor,
              fontSize: k16Sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
