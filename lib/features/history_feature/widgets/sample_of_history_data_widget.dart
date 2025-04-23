import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class SampleOfHistoryDataWidget extends StatelessWidget {
  final num width;
  const SampleOfHistoryDataWidget({
    super.key,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مرحباddddddddddddddddddddddd انا احمد',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: k16Sp,
            ),
          ),
          Text(
            '20/9/1000',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: k16Sp,
                color: kGreyColor),
          ),
        ],
      ),
    );
  }
}
