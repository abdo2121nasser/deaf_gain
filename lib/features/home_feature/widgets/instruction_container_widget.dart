import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';
import '../../../core/utils/values/font_size.dart';
import '../entities/instruction_entity.dart';

class InstructionContainerWidget extends StatelessWidget {
  final InstructionEntity instructionModel;
  const InstructionContainerWidget({
    super.key,
    required this.instructionModel
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: k10H,vertical: k5V),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(k20R),
          color: kWhiteColor,
          border: Border.all(color: kDarkBlueColor,width: k1H)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: kDarkBlueColor,
            child: Icon(instructionModel.iconData,color: kWhiteColor,),
          ),
          Text(
            instructionModel.title,
            style: TextStyle(
                color: kDarkBlueColor, fontSize: k16Sp, fontWeight: FontWeight.bold),
          ),
          Text(
            instructionModel.subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kGreyColor, fontSize: k16Sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
