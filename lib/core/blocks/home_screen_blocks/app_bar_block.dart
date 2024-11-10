import 'package:flutter/material.dart';

import '../../managers/font_manager.dart';
import '../../managers/string_ manager.dart';

class AppBarBlock extends StatelessWidget implements PreferredSizeWidget{
  const AppBarBlock({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final Ui ui = StringManager.ui;
    return AppBar(
      title:Text(ui.homeScreenAppbarTitle,
        style: TextStyle(fontSize: FontSize.s24),),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);




}
