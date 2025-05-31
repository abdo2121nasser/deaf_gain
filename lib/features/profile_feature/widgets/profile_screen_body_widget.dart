import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:deaf_gain/features/profile_feature/cubits/profile_cubit/profile_cubit.dart';
import 'package:deaf_gain/features/profile_feature/widgets/profile_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/values/app_size.dart';
import '../../authentication_feature/models/user_model.dart';
import 'update_profile_data_button_widget.dart';
import 'custom_profile_avatar_widget.dart';

class ProfileScreenBodyWidget extends StatelessWidget {
  ProfileScreenBodyWidget({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: k16H),
          sliver: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is SuccessState) {

                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: k10V),
                      CustomProfileAvatarWidget(
                        imageUrl: state.userEntity.avatarUrl,
                      ),
                      ProfileFormWidget(
                        globalKey: _globalKey,
                        firstNameController: _firstNameController..text=state.userEntity.firstName!,
                        lastNameController: _lastNameController..text=state.userEntity.lastName!,
                        phoneNumberController: _phoneNumberController..text=state.userEntity.phoneNumber!,
                        userEntity: state.userEntity,
                      ),
                      SizedBox(
                          height:
                              MediaQuery.maybeOf(context)!.size.height * 0.07),
                      UpdateProfileDataButtonWidget(
                        validateData: _validateDate,
                          onUpdate: () {
                            final updatedUser = UserModel(
                              id: state.userEntity.id,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              phoneNumber: _phoneNumberController.text,
                              email: state.userEntity.email,
                              token: state.userEntity.token,
                              expireDate: state.userEntity.expireDate,
                              avatarUrl: state.userEntity.avatarUrl,
                              subscriptionExpireDate: state.userEntity.subscriptionExpireDate,
                            );

                            ProfileCubit.get(context).updateUserData(userModel: updatedUser);
                          }
                        // userEntity:
                        // UserModel(
                        //     firstName: _firstNameController.text,
                        //     lastName:_lastNameController.text,
                        //     id: state.userEntity.id,
                        //     email: state.userEntity.email,
                        //     token: state.userEntity.token,
                        //     expireDate: state.userEntity.expireDate,
                        //     avatarUrl: state.userEntity.avatarUrl,
                        //     phoneNumber: _phoneNumberController.text,
                        //     subscriptionExpireDate:
                        //         state.userEntity.subscriptionExpireDate),
                      ),
                      SizedBox(height: k10V),
                    ],
                  ),
                );
              } else {
                // Error: fill the remaining space and center the message
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      kUnKnownProblemMessage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  bool _validateDate() => _globalKey.currentState?.validate() ?? false;
}
