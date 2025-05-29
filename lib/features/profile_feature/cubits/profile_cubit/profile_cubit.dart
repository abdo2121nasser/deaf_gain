import 'package:bloc/bloc.dart';
import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:deaf_gain/features/authentication_feature/repositories/store_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../authentication_feature/models/user_model.dart';
import '../../repositories/update_user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required UserEntity userEntity})
      : super(ProfileInitial(userEntity: userEntity));
  static ProfileCubit get(context) => BlocProvider.of(context);

  updateUserData({required UserModel userModel}) async {
    emit(UpdateUserDataLoadingState());
    UserEntity? userEntity =
        await UpdateUserFromApi(userModel: userModel).updateUser();
    if (userEntity != null) {
      // print(userEntity.token);
      await StoreUserByHive().storeUser(userEntity: userEntity);
      emit(UpdateUserDataSuccessState(userEntity: userEntity));
    } else {
      emit(UpdateUserDataErrorState());
    }
  }
}
