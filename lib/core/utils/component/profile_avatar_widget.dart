import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:flutter/material.dart';

import '../values/app_size.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String? userAvatar;

  const ProfileAvatarWidget({super.key, required this.userAvatar});

  @override
  Widget build(BuildContext context) {
    final hasAvatar = userAvatar != null && userAvatar!.isNotEmpty;

    return CircleAvatar(
      backgroundColor: kDarkBlueColor,
      backgroundImage: hasAvatar ? NetworkImage(userAvatar!) : null,
      radius: k50R,
      child: !hasAvatar
          ? Icon(
        Icons.person,
        size: k50R,
        color: kWhiteColor,
      )
          : null,
    );
  }
}
