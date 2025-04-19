import 'package:deaf_gain/core/services/validator_service.dart';
import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/custom_full_input_block.dart';
import 'package:deaf_gain/core/utils/component/custom_profile_avatar_widget.dart';
import 'package:deaf_gain/core/utils/component/general_button_widget.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/values/app_size.dart';
import '../../bottom_navigation_bar_feature/widgets/profile_tiltle_widget.dart';
import '../../bottom_navigation_bar_feature/widgets/update_profile_data_button_widget.dart';

class ProfileScreenBodyWidget extends StatefulWidget {
  const ProfileScreenBodyWidget({super.key});

  @override
  State<ProfileScreenBodyWidget> createState() =>
      _ProfileScreenBodyWidgetState();
}

class _ProfileScreenBodyWidgetState extends State<ProfileScreenBodyWidget> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: k16H),
      child: Form(
        key: _globalKey,
        child: Column(
          children: [
            SizedBox(
              height: k10V,
            ),
            const CustomProfileAvatarWidget(),
            SizedBox(
              height: k5V,
            ),
            const ProfileTitleWidget(),
            CustomFullInputBlock(
              label: 'الاسم الاول',
              controller: _firstNameController,
              validator: ValidatorService.validateName,
              hint: 'ادخل اسمك الاول',
              textColor: kBlackColor,
              enableBorder: true,
              prefixIcon: const Icon(
                Icons.person,
                color: kDarkBlueColor,
              ),
            ),
            SizedBox(
              height: k10V,
            ),
            CustomFullInputBlock(
              label: 'الاسم الاخير',
              controller: _lastNameController,
              validator: ValidatorService.validateName,
              hint: 'ادخل اسم العائله',
              textColor: kBlackColor,
              enableBorder: true,
              prefixIcon: const Icon(
                Icons.person,
                color: kDarkBlueColor,
              ),
            ),
            const Spacer(),
            UpdateProfileDataButtonWidget(
              validateData: _validateDate,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  bool _validateDate() => _globalKey.currentState!.validate();
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
