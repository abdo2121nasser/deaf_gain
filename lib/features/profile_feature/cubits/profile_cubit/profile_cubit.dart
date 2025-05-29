import 'package:bloc/bloc.dart';
import 'package:deaf_gain/features/authentication_feature/entities/user_entity.dart';
import 'package:deaf_gain/features/profile_feature/repositories/get_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required UserEntity userEntity}) : super(ProfileInitial(userEntity: userEntity));
  static ProfileCubit get(context) => BlocProvider.of(context);

  // getUserData() async {
  //   emit(GetUserDataLoadingState());
  //   UserEntity? userEntity = await GetUserFromHive().getUser();
  //   if (userEntity != null) {
  //     // print(userEntity.token);
  //     emit(GetUserDataSuccessState(userEntity: userEntity));
  //   } else {
  //     emit(GetUserDataErrorState());
  //   }
  // }
}
