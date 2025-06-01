
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/font_size.dart';
import '../../translate_feature/cubits/translate_cubit/translate_cubit.dart';

class TranslationSpeedRowWidget extends StatelessWidget {
  const TranslationSpeedRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed:
          TranslateCubit.get(context).decrementTranslationSpeed, icon: Icon(CupertinoIcons.minus,color: kDarkBlueColor,),
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(kWhiteColor)),
        ),
        BlocBuilder<TranslateCubit, TranslateState>(
          builder: (context, state) {
            return Text('${TranslateCubit.get(context).translationSpeed}',style: TextStyle(color: kBlackColor,fontSize: k25Sp),);
          },
        ),

        IconButton(onPressed:TranslateCubit.get(context).incrementTranslationSpeed, icon: Icon(CupertinoIcons.add,color: kDarkBlueColor,),
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(kWhiteColor)),
        ),

      ],
    );
  }
}
