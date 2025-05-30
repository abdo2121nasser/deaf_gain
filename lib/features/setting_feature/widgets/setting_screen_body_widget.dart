import 'dart:io';

import 'package:deaf_gain/features/setting_feature/widgets/setting_options_list_view_widget.dart';
import 'package:deaf_gain/root/app_root.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/utils/component/toast_message_function.dart';
import '../../main_feature/entities/List_title_item_entity.dart';
import 'dialog_boxes_widgets.dart';

class SettingScreenBodyWidget extends StatefulWidget {
  const SettingScreenBodyWidget({super.key});

  @override
  State<SettingScreenBodyWidget> createState() => _SettingScreenBodyWidgetState();
}

class _SettingScreenBodyWidgetState extends State<SettingScreenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    final List<ListTitleItemEntity> items = [
      // ListTitleItemEntity(
      //   text: 'الاشعارات',
      //   iconData: Icons.notifications,
      //   onClick: () {},
      // ),
      ListTitleItemEntity(
        text: themeNotifier.value == ThemeMode.light?'الوضع المظلم': "الوضع المضىء",
        iconData: themeNotifier.value == ThemeMode.light
            ? Icons.dark_mode_outlined
            : Icons.light_mode,
        onClick: () {
          themeNotifier.toggleTheme();
          setState(() {}); // Force rebuild to update the icon
        },
      ),
      ListTitleItemEntity(
        text: 'قيم التطبيق',
        iconData: Icons.star_rate_rounded,
        onClick: () {
          showRatingDialog(context);
        },
      ),
      ListTitleItemEntity(
        text: 'شارك التطبيق',
        iconData: Icons.share,
        onClick: shareApk,
      ),
      ListTitleItemEntity(
        text: 'تواصل معنا',
        iconData: Icons.contact_support,
        onClick: () {
          showContactInfoDialog(context);
        },
      ),
    ];

    return Column(

      children: [
        SettingOptionsListViewWidget(items: items),
      ],
    );
  }



  Future<void> shareApk() async {
    if (Platform.isAndroid) {
      try {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String packageName = packageInfo.packageName;

        // This path points to the installed APK of your app
        final apkPath = "/data/app/$packageName-1/base.apk";

        final apkFile = File(apkPath);
        if (await apkFile.exists()) {
          await Share.shareXFiles([XFile(apkPath)], text: 'Check out this app!');
        } else {
          showToastMessage(message: 'حدث خطاء ما رجاء حاول المحاوله');

          debugPrint('APK file not found at: $apkPath');
        }
      } catch (e) {
        debugPrint("Error sharing APK: $e");
        showToastMessage(message: 'حدث خطاء ما رجاء حاول المحاوله');

      }
    } else {
      debugPrint("Sharing APK is only supported on Android.");
      showToastMessage(message: 'حدث خطاء ما رجاء حاول المحاوله');

    }
  }

}


