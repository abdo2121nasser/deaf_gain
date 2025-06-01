import 'package:deaf_gain/features/translate_feature/cubits/out_put_type_cubit/out_put_type_cubit.dart';
import 'package:deaf_gain/features/translate_feature/enums/output_type_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'out_put_option_widget.dart';

class HorizontalOptionsListWidget extends StatelessWidget {
  const HorizontalOptionsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var output = OutPutTypeCubit.get(context);
    return BlocBuilder<OutPutTypeCubit, OutPutTypeState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutPutOptionWidget(
              isSelected: state.outPutType == OutPutTypeEnum.text,
              text: 'نص',
              iconData: CupertinoIcons.text_alignright,
              onTap: () {
                output.changeOutPutType(outPutTypeEnum: OutPutTypeEnum.text);
              },
            ),
            OutPutOptionWidget(
              isSelected: state.outPutType == OutPutTypeEnum.sound,
              text: 'صوت',
              iconData: CupertinoIcons.volume_up,
              onTap: () {
                output.changeOutPutType(outPutTypeEnum: OutPutTypeEnum.sound);
              },
            ),
            OutPutOptionWidget(
              isSelected: state.outPutType == OutPutTypeEnum.both,
              text: 'معا',
              iconData: Icons.record_voice_over,
              onTap: () {
                output.changeOutPutType(outPutTypeEnum: OutPutTypeEnum.both);
              },
            )
          ],
        );
      },
    );
  }
}
