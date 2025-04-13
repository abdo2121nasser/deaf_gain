import 'package:deaf_gain/features/home_feature/models/instruction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/values/app_size.dart';
import 'instruction_container_widget.dart';

class InstructionListWidget extends StatelessWidget {
  InstructionListWidget({
    super.key,
  });
  final List<InstructionModel> _instructions = [
    InstructionModel(
        iconData: Icons.camera_alt_rounded,
        title: 'النقاط الإشارات',
        subTitle: 'التقاط حركات لغة الإشاره بدقة عالية عبر كاميرا الجهار'),
    InstructionModel(
        iconData: Icons.text_fields_rounded,
        title: 'تحويل إلى نص',
        subTitle: 'تحويل الإشارات مباشرة إلى نص مكنوب بشكل فوري'),
    InstructionModel(
        iconData: Icons.volume_up,
        title: 'نص منطوق',
        subTitle: 'تحويل النص المترجم إلى صوت منطوق شكل وضح'),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 3,
      itemBuilder: (context, index) => Center(
        child: SizedBox(
            width: MediaQuery.maybeOf(context)!.size.width * 0.7,
            child: InstructionContainerWidget(
              instructionModel: _instructions[index],
            )),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: k10V,
      ),
    );
  }
}
