

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';

class OutPutOptionWidget extends StatelessWidget {
  final String text;
  final IconData iconData;
  const OutPutOptionWidget({
    super.key, required this.text, required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: k10H,vertical: k5V),
        decoration: BoxDecoration(
          color: kGreyColor,
          borderRadius: BorderRadius.circular(k20R)
        ),
        child: Row(
          children: [
             Icon(iconData,color: kDarkBlueColor,),
            SizedBox(width: k10H,),
            Text(text,style: TextStyle(
                color:kDarkBlueColor,
                fontSize: k20Sp,
                fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
    );
  }
}

