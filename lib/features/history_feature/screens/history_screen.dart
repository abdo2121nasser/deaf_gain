import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/values/font_size.dart';
import '../widgets/delete_button_widget.dart';
import '../widgets/history_item_widget.dart';
import '../widgets/image_of_video_widget.dart';
import '../widgets/sample_of_history_data_widget.dart';
import '../widgets/video_cash_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Expanded(
          child: ListView.separated(
               itemBuilder: (BuildContext context, int index)=> HistoryItemWidget(),
          separatorBuilder: (context, index) => SizedBox(height: k5V,),
            itemCount: 5,

          ),
        )
      ],
    );
  }
}




