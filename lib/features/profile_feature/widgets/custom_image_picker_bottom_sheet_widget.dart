
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../configuration/routes.dart';

class CustomImagePickerBottomSheetWidget extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  const CustomImagePickerBottomSheetWidget({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt, color: Colors.redAccent),
            title: const Text("التقط صوره من الكاميرا"),
            onTap: () {
              AppRoute.router.pop();
              onCameraTap();
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library, color: Colors.blueAccent),
            title: const Text("اختر صوره من المعرض"),
            onTap: () {
              AppRoute.router.pop();
              onGalleryTap();
            },
          ),
        ],
      ),
    );
  }
}
