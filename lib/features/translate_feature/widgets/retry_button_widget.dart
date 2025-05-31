import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';

class RetryButtonWidget extends StatelessWidget {
  final VoidCallback onTab;
  const RetryButtonWidget({
    super.key,
    required this.onTab
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTab,
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(kDarkBlueColor)
      ), child: Text('حاول مره اخري',style: TextStyle(
          color:
          kWhiteColor,fontSize: k16Sp
      ),),
    );
  }
}
