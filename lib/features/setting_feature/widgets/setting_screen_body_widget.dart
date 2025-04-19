import 'package:deaf_gain/features/setting_feature/widgets/setting_options_list_view_widget.dart';
import 'package:deaf_gain/root/app_root.dart';
import 'package:flutter/material.dart';

import '../../main_feature/entities/List_title_item_entity.dart';

class SettingScreenBodyWidget extends StatelessWidget {
  SettingScreenBodyWidget({super.key});
  final List<ListTitleItemEntity> _items = [
    ListTitleItemEntity(
        text: 'الاشعارات', iconData: Icons.notifications, onClick: () {}),
    ListTitleItemEntity(
        text: 'الوضع', iconData: Icons.light_mode, onClick: () {
    }),
    ListTitleItemEntity(
        text: 'قيم التطبيق', iconData: Icons.star_rate_rounded, onClick: () {}),
    ListTitleItemEntity(
        text: 'شارك التطبيق', iconData: Icons.share, onClick: () {}),
    ListTitleItemEntity(
        text: 'تواصل معنا', iconData: Icons.contact_support, onClick: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingOptionsListViewWidget(
          items: _items,
        )
      ],
    );
  }
}
