import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class ProfileTitleWidget extends StatelessWidget {
  final UserEntity userEntity;
  const ProfileTitleWidget({
    super.key,
    required this.userEntity
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${userEntity.firstName} ${userEntity.lastName}',
          style: TextStyle(
              fontSize: k16Sp,
              color: kDarkBlueColor,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
        Text(
          userEntity.email.toString(),
          style: TextStyle(
              fontSize: k16Sp,
              color: kGreyColor,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
