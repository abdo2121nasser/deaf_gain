import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:flutter/material.dart';
import '../../../core/services/validator_service.dart';
import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/custom_full_input_block.dart';
import '../../../core/utils/values/app_size.dart';
import '../../main_feature/widgets/profile_title_widget.dart';
import 'custom_profile_avatar_widget.dart';

class ProfileFormWidget extends StatefulWidget {
  const ProfileFormWidget({
    super.key,
    required this.globalKey,
    required this.userEntity,
  });

  final GlobalKey<FormState> globalKey;
  final UserEntity userEntity;

  @override
  State<ProfileFormWidget> createState() => _ProfileFormWidgetState();
}

class _ProfileFormWidgetState extends State<ProfileFormWidget> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.userEntity.firstName??'';
    _lastNameController.text = widget.userEntity.lastName ??'';
    _phoneNumberController.text = widget.userEntity.phoneNumber ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: Column(
        children: [

          SizedBox(height: k10V),
          ProfileTitleWidget(userEntity: widget.userEntity,),
          SizedBox(height: k10V),

          CustomFullInputBlock(
            label: 'الاسم الاول',
            controller: _firstNameController,
            validator: ValidatorService.validateName,
            hint: 'ادخل اسمك الاول',
            textColor: kBlackColor,
            enableBorder: true,
            prefixIcon: const Icon(Icons.person, color: kDarkBlueColor),
          ),
          SizedBox(height: k10V),
          CustomFullInputBlock(
            label: 'الاسم الاخير',
            controller: _lastNameController,
            validator: ValidatorService.validateName,
            hint: 'ادخل اسم العائله',
            textColor: kBlackColor,
            enableBorder: true,
            prefixIcon: const Icon(Icons.person, color: kDarkBlueColor),
          ),
          SizedBox(height: k10V),
          CustomFullInputBlock(
            label: 'رقم الهاتف',
            controller: _phoneNumberController,
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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
