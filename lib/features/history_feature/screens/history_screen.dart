import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/history_item_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: k10V),
               itemBuilder: (BuildContext context, int index)=> const HistoryItemWidget(),
          separatorBuilder: (context, index) => SizedBox(height: k5V,),
            itemCount: 20,

          ),
        )
      ],
    );
  }
}




