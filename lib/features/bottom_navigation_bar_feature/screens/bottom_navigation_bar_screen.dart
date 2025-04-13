import 'package:deaf_gain/core/utils/colors/colors.dart';
import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/component/custom_app_bar_widget.dart';
import '../cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import '../widgets/custom_bottom_navigation_bar_widget.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarCubit(),
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'مترجم لغه الاشاره',
        ),
        body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
          builder: (context, state) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: k20H),
              child: state.body,
            );
          },
        ),
        drawer: Drawer(),
        bottomNavigationBar: const CustomBottomNavigationBarWidget(),
      ),
    );
  }
}
