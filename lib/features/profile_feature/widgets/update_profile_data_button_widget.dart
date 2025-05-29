import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:deaf_gain/features/authentication_feature/models/user_model.dart';
import 'package:deaf_gain/features/profile_feature/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/values/app_size.dart';

class UpdateProfileDataButtonWidget extends StatelessWidget {
  final bool Function() validateData;
  final UserEntity userEntity;
  const UpdateProfileDataButtonWidget(
      {super.key, required this.validateData, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return GeneralButtonWidget(
        label: 'تحديث الملف الشخصي',
        function: () {
          if (validateData()) {
            ProfileCubit.get(context).updateUserData(
                userModel: UserModel(
                    firstName: userEntity.firstName,
                    lastName: userEntity.lastName,
                    id: userEntity.id,
                    email: userEntity.email,
                    token: userEntity.token,
                    expireDate: userEntity.expireDate,
                    avatarUrl: userEntity.avatarUrl,
                    phoneNumber: userEntity.phoneNumber));
          }
        },
        textColor: kWhiteColor,
        backgroundColor: kDarkBlueColor,
        borderRadius: k10R);
  }
}
