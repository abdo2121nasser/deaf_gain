

import 'package:deaf_gain/features/translate_feature/enums/output_type_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';

class OutPutOptionWidget extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onTap;
  final bool isSelected;
  const OutPutOptionWidget({
    super.key, required this.text, required this.iconData,
    required this.onTap,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: k10H,vertical: k5V),
        decoration: BoxDecoration(
          color:isSelected? kWhiteColor:kDarkBlueColor ,
          borderRadius: BorderRadius.circular(k20R)
        ),
        child: Row(
          children: [
             Icon(iconData,color: isSelected? kDarkBlueColor:kWhiteColor,),
            SizedBox(width: k10H,),
            Text(text,style: TextStyle(
                color:isSelected? kDarkBlueColor:kWhiteColor,
                fontSize: k20Sp,
                fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
    );
  }
}

