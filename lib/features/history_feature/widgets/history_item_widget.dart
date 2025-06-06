import 'package:deaf_gain/features/history_feature/widgets/image_of_video_container_widget.dart';
import 'package:deaf_gain/features/history_feature/widgets/sample_of_history_data_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import 'delete_button_widget.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Container(
        width: double.maxFinite,
        height: k60V,
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(k10R),
            border: Border.all(width: k1H, color: kBlackColor)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeleteButtonWidget(
              width: constrain.maxWidth * 0.15,
            ),
            SampleOfHistoryDataWidget(
              width: constrain.maxWidth * 0.45,
            ),
            ImageOfVideoContainerWidget(
              constraints: constrain,
            )
          ],
        ),
      );
    });
  }
}
