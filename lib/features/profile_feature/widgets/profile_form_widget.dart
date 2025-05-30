import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:flutter/material.dart';
import '../../../core/services/validator_service.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/custom_full_input_block.dart';
import '../../../core/utils/values/app_size.dart';
import '../../main_feature/widgets/profile_title_widget.dart';
import 'custom_profile_avatar_widget.dart';

class ProfileFormWidget extends StatelessWidget {
  const ProfileFormWidget({
    super.key,
    required this.globalKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneNumberController,
    required this.userEntity,
  });

  final GlobalKey<FormState> globalKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneNumberController;
  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          SizedBox(height: k10V),
          ProfileTitleWidget(userEntity: userEntity),
          SizedBox(height: k10V),

          CustomFullInputBlock(
            label: 'الاسم الاول',
            controller: firstNameController,
            validator: ValidatorService.validateName,
            hint: 'ادخل اسمك الاول',
            textColor: kBlackColor,
            enableBorder: true,
            prefixIcon: const Icon(Icons.person, color: kDarkBlueColor),
          ),
          SizedBox(height: k10V),
          CustomFullInputBlock(
            label: 'الاسم الاخير',
            controller: lastNameController,
            validator: ValidatorService.validateName,
            hint: 'ادخل اسم العائله',
            textColor: kBlackColor,
            enableBorder: true,
            prefixIcon: const Icon(Icons.person, color: kDarkBlueColor),
          ),
          SizedBox(height: k10V),
          CustomFullInputBlock(
            label: 'رقم الهاتف',
            controller: phoneNumberController,
            validator: ValidatorService.validatePhoneNumber,
            hint: '01122333344444',
            textColor: kBlackColor,
            onlyInteger: true,
            enableBorder: true,
            prefixIcon: const Icon(Icons.person, color: kDarkBlueColor),
          ),
          SizedBox(height: k14V),
        ],
      ),
    );
  }
}

