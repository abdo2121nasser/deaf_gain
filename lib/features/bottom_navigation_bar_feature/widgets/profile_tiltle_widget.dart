import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class ProfileTitleWidget extends StatelessWidget {
  const ProfileTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'احمد محمد ',
          style: TextStyle(
              fontSize: k16Sp,
              color: kDarkBlueColor,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
        Text(
          'a@gmail.com',
          style: TextStyle(
              fontSize: k16Sp,
              color: kGreyColor,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
