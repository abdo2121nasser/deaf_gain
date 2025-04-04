import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../values/font_size.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Icon icon;
  final List<IconButton>? actions;

  const CustomAppBarWidget(
      {super.key,
      required this.title,
        this.actions,
      this.icon = const Icon(
        Icons.local_fire_department_outlined,
      )});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions:actions,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: k20Sp),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
