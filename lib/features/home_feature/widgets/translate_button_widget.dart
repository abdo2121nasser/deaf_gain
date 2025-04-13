import 'package:deaf_gain/features/bottom_navigation_bar_feature/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/component/general_button_widget.dart';
import '../../../core/utils/values/app_size.dart';

class TranslateButtonWidget extends StatelessWidget {
  const TranslateButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: k10V),
      child: GeneralButtonWidget(
        label: 'ابدء الترجمه الان',
        function: (){
          BottomNavigationBarCubit.get(context).setCurrentBodyWithIndex=1;
        },
        textColor: kWhiteColor,
        backgroundColor: kDarkBlueColor,
        borderRadius: k20R,
        icon:const Icon(CupertinoIcons.camera,color: kWhiteColor,),
      ),
    );
  }
}
