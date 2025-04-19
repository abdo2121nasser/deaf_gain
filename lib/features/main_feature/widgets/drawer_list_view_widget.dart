import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../entities/List_title_item_entity.dart';

class DrawerListViewWidget extends StatelessWidget {
  final List<ListTitleItemEntity> items;
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
