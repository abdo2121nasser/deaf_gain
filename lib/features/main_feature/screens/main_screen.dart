import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/component/custom_app_bar_widget.dart';
import '../repositories/get_user_repository.dart';
import '../cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import '../cubits/payment_cubit/payment_cubit.dart';
import '../widgets/custom_bottom_navigation_bar_widget.dart';
import '../widgets/custom_drawer_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserEntity?  userEntity ;
  @override
  void initState() {
    super.initState();
   userEntity= GetUserFromHive().getUser();
  }
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
              padding: EdgeInsets.symmetric(horizontal: k20H),
              child: state.body,
            );
          },
        ),
        drawer: BlocProvider(
          create: (context) => PaymentCubit(),
          child: CustomDrawerWidget(userEntity: userEntity!,),
        ),
        bottomNavigationBar: const CustomBottomNavigationBarWidget(),
      ),
    );
  }
}
