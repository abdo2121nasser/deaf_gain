import 'package:deaf_gain/configuration/routes.dart';
import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/general_button_widget.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:deaf_gain/features/main_feature/widgets/sign_out_button_widget.dart';

import 'package:flutter/material.dart';

import '../../../core/utils/component/custom_profile_avatar_widget.dart';
import '../entities/drawer_item_entity.dart';
import 'drawer_list_view_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerWidget({super.key});
  final List<DrawerItemEntity> _items = [
    DrawerItemEntity(text: 'الحساب', iconData: Icons.person, onClick: () {
      AppRoute.router.push(AppRoute.profileScreen);
    }),
    DrawerItemEntity(
        text: 'الاعدادات', iconData: Icons.settings, onClick: () {}),
    DrawerItemEntity(
        text: 'دليل لغه الاشعاره', iconData: Icons.menu_book, onClick: () {}),
    DrawerItemEntity(
        text: 'النسخه المميزه', iconData: Icons.paid, onClick: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: k16V,),

          const CustomProfileAvatarWidget(),
          SizedBox(height: k5V,),
          Text(
            'محمد احمد',
            style: TextStyle(
              fontSize: k18Sp,
              color: kDarkBlueColor,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: k5V,),

          DrawerListViewWidget(
            items: _items,
          ),
const Spacer(),
          const SignOutButtonWidget(),
          const Spacer(),

        ],
      ),
    );
  }
}
