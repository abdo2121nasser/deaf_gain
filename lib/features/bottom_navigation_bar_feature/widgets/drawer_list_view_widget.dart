import 'package:deaf_gain/features/bottom_navigation_bar_feature/entities/drawer_item_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';

class DrawerListViewWidget extends StatelessWidget {
  final List<DrawerItemEntity> items;
  const DrawerListViewWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(items[index].iconData, color: kDarkBlueColor),
        title: Text(
          items[index].text,
          style: const TextStyle(
              color: kDarkBlueColor, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: kDarkBlueColor),
        onTap:items[index].onClick,
      ),
      itemCount: items.length,
    );
  }
}
