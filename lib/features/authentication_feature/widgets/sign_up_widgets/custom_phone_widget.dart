import 'package:flutter/cupertino.dart';

import '../../../../core/services/validator_service.dart';
import '../../../../core/utils/colors/colors.dart';
import '../../../../core/utils/component/custom_full_input_block.dart';



class CustomPhoneWidget extends StatelessWidget {

  final TextEditingController controller;
  const CustomPhoneWidget({
    super.key,
    required this.controller,});

  @override
  Widget build(BuildContext context) {
    return CustomFullInputBlock(
      label:'ادخل رقمك',
      hint: '01122333444',
      validator: ValidatorService.validatePhoneNumber,
      textColor: kBlackColor,
      onlyInteger: true,
      enableBorder: true,
      prefixIcon: const Icon(
        CupertinoIcons.phone,
        color: kDarkBlueColor,
      ),
      controller: controller,);
  }
}
