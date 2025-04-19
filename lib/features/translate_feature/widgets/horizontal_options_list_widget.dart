import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'out_put_option_widget.dart';

class HorizontalOptionsListWidget extends StatelessWidget {
  const HorizontalOptionsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutPutOptionWidget(
          text: 'نص',
          iconData: CupertinoIcons.text_alignright,
        ),
        OutPutOptionWidget(
          text: 'صوت',
          iconData: CupertinoIcons.volume_up,
        ),
        OutPutOptionWidget(
          text: 'معا',
          iconData: Icons.record_voice_over,
        )
      ],
    );
  }
}
