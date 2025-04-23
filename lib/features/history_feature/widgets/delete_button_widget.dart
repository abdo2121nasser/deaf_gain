import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';

class DeleteButtonWidget extends StatelessWidget {
  final num width;
  const DeleteButtonWidget({
    super.key,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.delete,
            color: kRedColor,
          )),
    );
  }
}
