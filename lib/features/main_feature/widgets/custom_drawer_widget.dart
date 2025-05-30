import 'package:deaf_gain/configuration/routes.dart';
import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/component/general_button_widget.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:deaf_gain/features/authentication_feature/repositories/store_user_repository.dart';
import 'package:deaf_gain/features/main_feature/cubits/payment_cubit/payment_cubit.dart';
import 'package:deaf_gain/features/main_feature/entities/extra_entity.dart';
import 'package:deaf_gain/features/main_feature/widgets/sign_out_button_widget.dart';
import 'package:deaf_gain/features/profile_feature/cubits/profile_cubit/profile_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/component/profile_avatar_widget.dart';
import '../../authentication_feature/entities/user_entity.dart';
import '../entities/List_title_item_entity.dart';
import 'drawer_list_view_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
  UserEntity userEntity;

  CustomDrawerWidget({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    final List<ListTitleItemEntity> _items = [
      ListTitleItemEntity(
          text: 'الحساب',
          iconData: Icons.person,
          onClick: () {
            AppRoute.router.push(AppRoute.profileScreen,
                extra: ExtraDataEntity(
                    profileCubit: ProfileCubit.get(context),
                    userEntity: userEntity));
          }),
      ListTitleItemEntity(
          text: 'الاعدادات',
          iconData: Icons.settings,
          onClick: () {
            AppRoute.router.push(AppRoute.settingScreen);
          }),
      ListTitleItemEntity(
          text: 'دليل لغه الاشعاره',
          iconData: Icons.menu_book,
          onClick: () {
            AppRoute.router.push(AppRoute.guideScreen);
          }),
      ListTitleItemEntity(
          text: 'النسخه المميزه',
          iconData: Icons.paid,
          onClick: () async {
            await PaymentCubit.get(context).makeStripePayment(amount: 50);
            userEntity.subscriptionExpireDate =
                DateTime.now().add(const Duration(days: 30));
            await StoreUserByHive().storeUser(userEntity: userEntity);
            ProfileCubit.get(context).getUserData();
          }),
    ];

    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: k16V,
          ),
          ProfileAvatarWidget(
            userAvatar: userEntity.avatarUrl,
          ),
          SizedBox(
            height: k5V,
          ),
          Text(
            userEntity.firstName.toString(),
            style: TextStyle(
              fontSize: k18Sp,
              color: kDarkBlueColor,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: k5V,
          ),
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
