import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.waving_hand,
          color: kDarkBlueColor,
          size: MediaQuery.maybeOf(context)!.size.height * 0.1,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: k5V),
          child: Text(
            'تواصل بلا حدود',
            style: TextStyle(
                color: kBlackColor, fontSize: k16Sp, fontWeight: FontWeight.bold),
          ),
        ),

        Text(
          'ترجمه فوريه للغة الإشاره إلى نص وصوت في ثوان معدودة',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kDarkBlueColor, fontSize: k16Sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
