import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/values/app_size.dart';

class UpdateProfileDataButtonWidget extends StatelessWidget {
  const UpdateProfileDataButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: 'تحديث الملف الشخصي',
        function: () {},
        textColor: kWhiteColor,
        backgroundColor: kDarkBlueColor,
        borderRadius: k10R);
  }
}
