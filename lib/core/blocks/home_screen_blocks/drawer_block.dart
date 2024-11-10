import 'package:deaf_gain/core/managers/font_manager.dart';
import 'package:deaf_gain/core/managers/image_manager.dart';
import 'package:flutter/material.dart';

import '../../managers/string_ manager.dart';

class DrawerBlock extends StatelessWidget {
  const DrawerBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final Ui ui = StringManager.ui;

    return Drawer(
      child: Column(
        children: [
          // Image.asset(kAppImage,
          // ),
          DrawerHeader(
            padding:  EdgeInsets.zero,
            decoration: const BoxDecoration(
            ),
            child: Image.asset(
              kAppImage,
              fit: BoxFit.fitWidth,
              width:MediaQuery.of(context).size.width,
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.contact_support,
            ),
            title: Text(
              ui.homeScreenDrawerContactItem,
              style: TextStyle(
                  fontSize: FontSize.s14, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
