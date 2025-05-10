import 'package:flutter/cupertino.dart';

import '../../../../core/services/validator_service.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/custom_full_input_block.dart';



class CustomNameWidget extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  const CustomNameWidget({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFullInputBlock(
      label:label,
      hint: 'ادخل الاسم',
      validator: ValidatorService.validateName,
      textColor: kBlackColor,
      enableBorder: true,
      prefixIcon: const Icon(
        CupertinoIcons.person,
        color: kDarkBlueColor,
      ),
      controller: controller,);
  }
}
