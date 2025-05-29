import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/app_size.dart';

class ProfileAvatarWidget extends StatelessWidget {
  String userAvatar;
  ProfileAvatarWidget({super.key, required this.userAvatar});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kWhiteColor,
      backgroundImage: userAvatar != null && userAvatar.isNotEmpty
          ? NetworkImage(userAvatar)
          : null,
      child: userAvatar == null || userAvatar.isEmpty
          ? Icon(
              Icons.person,
              size: k50R,
              color: Colors.grey,
            )
          : null,
      radius: k50R,

    );
  }
}
