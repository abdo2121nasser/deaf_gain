import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/values/app_size.dart';

class SignOutButtonWidget extends StatelessWidget {
  const SignOutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: 'تسجيل الخروج',
        function: (){},
        textColor: kWhiteColor,
        backgroundColor: kRedColor,
        borderRadius: k20R);
  }
}
