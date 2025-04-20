import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/app_size.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: Image.network('https://th.bing.com/th/id/OIP.TgxoG3MFBwXLZZo2xGvYoAHaHa?rs=1&pid=ImgDetMain',
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.person,
            size: k50R,
            color: Colors.grey,
          );
        },

      ).image,
      radius: k50R,
    );
  }
}
