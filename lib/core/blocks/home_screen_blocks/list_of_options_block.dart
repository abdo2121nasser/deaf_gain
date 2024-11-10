import 'package:deaf_gain/core/blocks/home_screen_blocks/widgets/option_item_widget.dart';
import 'package:deaf_gain/core/managers/values_manager.dart';
import 'package:flutter/material.dart';

class ListOfOptionsBlock extends StatelessWidget {
   ListOfOptionsBlock({super.key});
final List<IconData> icons=[
  Icons.short_text_rounded,
  Icons.volume_up,
  Icons.live_tv

];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(

      shrinkWrap: true,
        itemBuilder: (context, index) => OptionItemWidget(icon: icons[index],),
        separatorBuilder: (context, index) => SizedBox(height: MediaQuery.maybeOf(context)!.size.height*0.06,),
        itemCount: 3);
  }
}
