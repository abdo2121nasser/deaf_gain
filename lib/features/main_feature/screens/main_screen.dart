import 'package:deaf_gain/core/utils/values/app_size.dart';
import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/component/custom_app_bar_widget.dart';
import '../../profile_feature/cubits/profile_cubit/profile_cubit.dart';
import '../repositories/get_user_repository.dart';
import '../cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import '../cubits/payment_cubit/payment_cubit.dart';
import '../widgets/custom_bottom_navigation_bar_widget.dart';
import '../widgets/custom_drawer_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationBarCubit()),
        BlocProvider(create: (context) => ProfileCubit()..getUserData()),
      ],
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
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is GetUserDataSuccessState) {
                return CustomDrawerWidget(
                  userEntity: state.userEntity,
                );
              } else {
                return const Drawer(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBarWidget(),
      ),
    );
  }
}
