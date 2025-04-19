import 'package:deaf_gain/core/utils/component/general_button_widget.dart';
import 'package:deaf_gain/core/utils/component/general_text_form_field.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';

void showRatingDialog(BuildContext context) {
  final TextEditingController suggestionController = TextEditingController();
  int rating = 0;

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: kBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(k16R),
          ),
          contentPadding: EdgeInsets.all(k20R),
          contentTextStyle: TextStyle(fontSize: k16Sp, color: kDarkBlueColor),
          title: Text(
            'تقييم التطبيق',
            style: TextStyle(
                color: kDarkBlueColor,
                fontSize: k20Sp,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: k25Sp,
                    ),
                    onPressed: () {
                      setState(() => rating = index + 1);
                    },
                  );
                }),
              ),
              SizedBox(height: k12Sp),
              GeneralTextFormField(
                controller: suggestionController,
                expandMultiLine: true,
                hint: 'اكتب اقتراحاتك هنا...',
                enableBorder: true,
                multiLine: true,
              )
            ],
          ),
          actions: [
            GeneralButtonWidget(
                label: 'ارسل',
                function: (){},
                textColor: kWhiteColor,
                backgroundColor: kDarkBlueColor,
                borderRadius: k20R),
            GeneralButtonWidget(
                label: 'الغاء',
                function: (){

                  Navigator.pop(context);
                },
                textColor: kWhiteColor,
                backgroundColor: kDarkBlueColor,
                borderRadius: k20R),
          ],
        );
      },
    ),
  );
}

void showContactInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: kBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(k16R),
      ),
      contentPadding:  EdgeInsets.all(k16Sp),
      title: Text(
        'معلومات التواصل',
      style:   TextStyle(
            color: kDarkBlueColor,
            fontSize: k20Sp,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            'اسم الشركة: Deaf Gain',
           style: TextStyle(
               color: kDarkBlueColor,
               fontSize: k14Sp,
               fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: k10V),
          Text(
            'البريد الإلكتروني: support@deafgain.com',
            style: TextStyle(
                color: kDarkBlueColor,
                fontSize: k14Sp,
                fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: k10V),
          Text(
            'العنوان: القاهرة، مصر',
            style: TextStyle(
                color: kDarkBlueColor,
                fontSize: k14Sp,
                fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
        ],

      ),
actions: [
  GeneralButtonWidget(
      label: 'رجوع',
      function: (){

        Navigator.pop(context);
      },
      textColor: kWhiteColor,
      backgroundColor: kDarkBlueColor,
      borderRadius: k20R),
],
    ),
  );
}
