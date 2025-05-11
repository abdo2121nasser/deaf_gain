import 'package:deaf_gain/core/services/validator_service.dart';
import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/custom_full_input_block.dart';
import 'package:deaf_gain/features/profile_feature/widgets/profile_form_widget.dart';

import 'package:flutter/material.dart';

import '../../../core/utils/values/app_size.dart';
import '../../main_feature/widgets/profile_title_widget.dart';
import '../../main_feature/widgets/update_profile_data_button_widget.dart';
import 'custom_profile_avatar_widget.dart';

class ProfileScreenBodyWidget extends StatelessWidget {
  ProfileScreenBodyWidget({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: k16H),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileFormWidget(
              globalKey: _globalKey,
            ),
            UpdateProfileDataButtonWidget(
              validateData: _validateDate,
            ),
            SizedBox(
              height: k10V,
            ),
          ],
        ),
      ),
    );
  }

  bool _validateDate() => _globalKey.currentState!.validate();
}
