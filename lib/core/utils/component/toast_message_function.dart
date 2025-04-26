import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/values/font_size.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage({required String message}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: kWhiteColor,
      backgroundColor: kDarkBlueColor,
      fontSize: k16Sp
  );
}