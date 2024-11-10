import 'package:deaf_gain/core/blocks/home_screen_blocks/app_bar_block.dart';
import 'package:deaf_gain/core/blocks/home_screen_blocks/drawer_block.dart';
import 'package:deaf_gain/core/managers/string_%20manager.dart';
import 'package:flutter/material.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Ui ui = StringManager.ui;
    final Logic logic = StringManager.logic;
    return const Scaffold(
      appBar: AppBarBlock(),
      drawer: DrawerBlock(),




    );
  }
}

