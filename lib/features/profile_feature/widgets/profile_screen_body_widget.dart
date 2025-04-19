import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/custom_full_input_block.dart';
import 'package:deaf_gain/core/utils/component/custom_profile_avatar_widget.dart';
import 'package:deaf_gain/core/utils/component/general_button_widget.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/values/app_size.dart';
import '../../bottom_navigation_bar_feature/widgets/profile_tiltle_widget.dart';
import '../../bottom_navigation_bar_feature/widgets/update_profile_data_button_widget.dart';

class ProfileScreenBodyWidget extends StatelessWidget {
  const ProfileScreenBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: k14H),
      child: Column(
        children: [
          SizedBox(height: k10V,),

          const CustomProfileAvatarWidget(),
          const ProfileTitleWidget(),
          CustomFullInputBlock(
            prefixIcon: const Icon(Icons.person,color: kDarkBlueColor,),
            label: 'الاسم الاول',
            textColor: kBlackColor,
            controller: TextEditingController(),
            enableBorder: true,
          ),
          SizedBox(height: k10V,),
          CustomFullInputBlock(
            prefixIcon: const Icon(Icons.person,color: kDarkBlueColor,),
            label: 'الاسم الاخير',
            textColor: kBlackColor,
            controller: TextEditingController(),
            enableBorder: true,
          ),
          const Spacer(),
          const UpdateProfileDataButtonWidget(),
          const Spacer()
        ],
      ),
    );
  }
}

