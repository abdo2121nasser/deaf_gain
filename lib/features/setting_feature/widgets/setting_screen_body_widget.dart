import 'package:deaf_gain/features/setting_feature/widgets/setting_options_list_view_widget.dart';
import 'package:deaf_gain/root/app_root.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../main_feature/entities/List_title_item_entity.dart';
import 'dialog_boxes_widgets.dart';

class SettingScreenBodyWidget extends StatefulWidget {
  const SettingScreenBodyWidget({super.key});

  @override
  State<SettingScreenBodyWidget> createState() => _SettingScreenBodyWidgetState();
}

class _SettingScreenBodyWidgetState extends State<SettingScreenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final List<ListTitleItemEntity> items = [
      ListTitleItemEntity(
        text: 'الاشعارات',
        iconData: Icons.notifications,
        onClick: () {},
      ),
      ListTitleItemEntity(
        text: themeNotifier.value == ThemeMode.light?'الوضع المظلم': "الوضع المضىء",
        iconData: themeNotifier.value == ThemeMode.light
            ? Icons.dark_mode_outlined
            : Icons.light_mode,
        onClick: () {
          themeNotifier.toggleTheme();
          setState(() {}); // Force rebuild to update the icon
        },
      ),
      ListTitleItemEntity(
        text: 'قيم التطبيق',
        iconData: Icons.star_rate_rounded,
        onClick: () {
          showRatingDialog(context);
        },
      ),
      ListTitleItemEntity(
        text: 'شارك التطبيق',
        iconData: Icons.share,
        onClick: _share,
      ),
      ListTitleItemEntity(
        text: 'تواصل معنا',
        iconData: Icons.contact_support,
        onClick: () {
          showContactInfoDialog(context);
        },
      ),
    ];

    return Column(

      children: [
        SettingOptionsListViewWidget(items: items),
      ],
    );
  }

  Future<ShareResult> _share() => Share.share('Share the App');
}


