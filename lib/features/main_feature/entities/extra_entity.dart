import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:deaf_gain/features/profile_feature/cubits/profile_cubit/profile_cubit.dart';

class ExtraDataEntity{
  final ProfileCubit profileCubit;
  final UserEntity userEntity;

  ExtraDataEntity({required this.profileCubit, required this.userEntity});



}