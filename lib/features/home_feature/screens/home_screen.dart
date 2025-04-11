import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/features/home_feature/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/component/custom_app_bar_widget.dart';
import '../widgets/custom_bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarCubit(),
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'مترجم لغه الاشاره',
        ),
        body: const SizedBox(),
        bottomNavigationBar: CustomBottomNavigationBarWidget(),
      ),
    );
  }
}
