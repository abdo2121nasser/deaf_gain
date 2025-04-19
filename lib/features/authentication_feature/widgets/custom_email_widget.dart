import 'package:flutter/cupertino.dart';

import '../../../core/services/validator_service.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/custom_full_input_block.dart';

class CustomEmailWidget extends StatelessWidget {

  final TextEditingController controller;
  const CustomEmailWidget({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return CustomFullInputBlock(
      label: 'البريد الاليكتروني',
      hint: 'ادخل بريدك الاليكتروني',
      validator: ValidatorService.validateEmail,
      textColor: kBlackColor,
      enableBorder: true,
      prefixIcon: const Icon(
        CupertinoIcons.envelope,
        color: kDarkBlueColor,
      ),
      controller: controller,);
  }
}
