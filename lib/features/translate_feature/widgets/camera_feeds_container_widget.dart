import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../core/utils/values/app_size.dart';


class CameraFeedsContainerWidget extends StatelessWidget {
  const CameraFeedsContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.maybeOf(context)!.size.height*0.3,
      decoration: BoxDecoration(

          color: kDarkBlueColor,
          borderRadius: BorderRadius.circular(k14R)
      ),
      child: Icon(CupertinoIcons.camera_fill,color: kWhiteColor,
        size: MediaQuery.maybeOf(context)!.size.height*0.2,
      ),
    );
  }
}
