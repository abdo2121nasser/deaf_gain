import 'package:deaf_gain/core/blocks/home_screen_blocks/app_bar_block.dart';
import 'package:deaf_gain/core/blocks/home_screen_blocks/drawer_block.dart';
import 'package:deaf_gain/core/managers/string_%20manager.dart';
import 'package:deaf_gain/core/managers/values_manager.dart';
import 'package:flutter/material.dart';

import '../core/blocks/home_screen_blocks/list_of_options_block.dart';
import '../core/blocks/home_screen_blocks/widgets/option_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Ui ui = StringManager.ui;
    final Logic logic = StringManager.logic;
    return Scaffold(
      appBar: const AppBarBlock(),
      drawer: const DrawerBlock(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListOfOptionsBlock(),
        ],
      ),
    );
  }
}

