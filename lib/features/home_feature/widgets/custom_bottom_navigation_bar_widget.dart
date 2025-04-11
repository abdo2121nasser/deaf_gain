import 'package:deaf_gain/features/home_feature/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/colors/colors.dart';

class CustomBottomNavigationBarWidget extends StatelessWidget {
  const CustomBottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: BottomNavigationBarCubit.get(context).currentBody,
          onTap: (index) {
            BottomNavigationBarCubit.get(context).currentBody = index;
          },
          selectedItemColor: kDarkBlueColor,
          unselectedItemColor: kGreyColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.camera_fill), label: 'ترجمه'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'السجل'),
          ],
        );
      },
    );
  }
}
