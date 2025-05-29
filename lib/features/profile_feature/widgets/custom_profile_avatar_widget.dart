import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/colors/colors.dart';
import '../../../features/profile_feature/cubits/image_cubit/image_cubit.dart';
import '../../../features/profile_feature/widgets/custom_image_picker_bottom_sheet_widget.dart';

class CustomProfileAvatarWidget extends StatelessWidget {
  const CustomProfileAvatarWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            // _showImagePickerBottomSheet(
            //     context: context,
            //     onCameraTap: ImageCubit.get(context).pickImageFromCamera,
            //     onGalleryTap: ImageCubit.get(context).pickImageFromGallery);
          },
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.08,
            backgroundColor: kWhiteColor,
            child: BlocBuilder<ImageCubit, ImageState>(
              builder: (context, state) {
                return CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.07,
                  backgroundColor: kDarkBlueColor,
                  backgroundImage: state.image != null
                      ? FileImage(
                          state.image!)
                      : (imageUrl.isNotEmpty
                          ? NetworkImage(
                              imageUrl)
                          : null),
                  child: imageUrl.isEmpty && state.image == null
                      ? Icon(
                          Icons.person,
                          color: kWhiteColor,
                          size: MediaQuery.of(context).size.height *
                              0.07, // Keep the size consistent
                        )
                      : null, // Only show the icon if no image source is available
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: kWhiteColor,
            radius: MediaQuery.of(context).size.height * 0.025,
            child: Icon(
              CupertinoIcons.camera,
              color: kBlackColor,
              size: MediaQuery.of(context).size.height * 0.035,
            ),
          ),
        ),
      ],
    );
  }

  void _showImagePickerBottomSheet({
    required BuildContext context,
    required VoidCallback onCameraTap,
    required VoidCallback onGalleryTap,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return CustomImagePickerBottomSheetWidget(
          onCameraTap: onCameraTap,
          onGalleryTap: onGalleryTap,
        );
      },
    );
  }
}
