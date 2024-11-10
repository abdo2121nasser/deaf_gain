import 'package:fluttertoast/fluttertoast.dart';

import 'color_manager.dart';
import 'font_manager.dart';


getToastMessage({required String message,})
   {
     Fluttertoast.showToast(
         msg: message,
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         textColor: kWhiteColor,
         backgroundColor: kPurpleColor,
         fontSize: FontSize.s16
     );
   }