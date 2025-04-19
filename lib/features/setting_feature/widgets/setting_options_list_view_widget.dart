import 'package:deaf_gain/features/main_feature/entities/List_title_item_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';

class SettingOptionsListViewWidget extends StatelessWidget {
  final List<ListTitleItemEntity> items;
  const SettingOptionsListViewWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(items[index].iconData, color: kDarkBlueColor),
        title: Text(
          items[index].text,
          style: const TextStyle(color: kDarkBlueColor, fontWeight: FontWeight.bold),
        ),
        onTap: items[index].onClick,
      ),
      itemCount: items.length,
    );
  }
}
