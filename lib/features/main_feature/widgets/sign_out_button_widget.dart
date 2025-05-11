import 'package:deaf_gain/configuration/routes.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/values/app_size.dart';
import '../../authentication_feature/repositories/delete_user_repository.dart';

class SignOutButtonWidget extends StatelessWidget {
  const SignOutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: 'تسجيل الخروج',
        function: signOut,
        textColor: kWhiteColor,
        backgroundColor: kRedColor,
        borderRadius: k20R);
  }

  void signOut() async {
       await DeleteUserFromHive().deleteUser();
       AppRoute.router.pushReplacement(AppRoute.authenticationScreen);
      }
}
