import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/app_size.dart';

class ProfileAvatarWidget extends StatelessWidget {
  String? userAvatar;
  ProfileAvatarWidget({super.key, required this.userAvatar});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kDarkBlueColor,
      backgroundImage: userAvatar!=null
          ? NetworkImage(userAvatar!)
          : null,
      radius: k50R,
      child: userAvatar==null
          ? Icon(
              Icons.person,
              size: k50R,
              color: kWhiteColor,
            )
          : null,

    );
  }
}
