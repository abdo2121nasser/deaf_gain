import 'package:deaf_gain/core/utils/component/custom_app_bar_widget.dart';
import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:deaf_gain/features/profile_feature/cubits/image_cubit/image_cubit.dart';
import 'package:deaf_gain/features/profile_feature/cubits/profile_cubit/profile_cubit.dart';
import 'package:deaf_gain/features/profile_feature/widgets/profile_screen_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final UserEntity userEntity;
  const ProfileScreen({super.key,required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'الحساب الشخصي'),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ImageCubit()),
          BlocProvider(create: (context) => ProfileCubit(userEntity: userEntity)),
        ],
        child: ProfileScreenBodyWidget(),
      ),
    );
  }
}
