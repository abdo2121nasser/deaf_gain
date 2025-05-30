import 'package:deaf_gain/core/services/dio_service.dart';
import 'package:deaf_gain/core/utils/strings/end_points.dart';
import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:deaf_gain/features/authentication_feature/repositories/store_user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../../core/services/failure_service.dart';
import '../../../core/utils/component/toast_message_function.dart';
import '../../authentication_feature/entities/user_entity.dart';
import '../../authentication_feature/models/user_model.dart';

abstract class UpdateUserRepository {
  Future<UserEntity?> updateUser();
}

class UpdateUserFromApi implements UpdateUserRepository {
  final UserModel userModel;

  UpdateUserFromApi({required this.userModel});
  @override
  Future<UserEntity?> updateUser() async {
    try {
      print(userModel.id!);
      Response response = await DioHelper.putData(
          url: kUpdateUserEndPoint + userModel.id!, data: userModel.toJson());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        UserEntity userEntity = UserModel.fromUpdatedDataJson(response.data);
        return userEntity;
      } else {
        return null;
      }
    } on DioException catch (e) {
      final failure = ServerFailure.fromServer(e);
      debugPrint(failure.devMessage);
      debugPrint(e.toString());

      showToastMessage(
        message: failure.userMessage,
      );
      return null;
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnKnownProblemMessage);
      return null;
    }
  }
}

class UpdateUserFromHive implements UpdateUserRepository {
  final UserModel userModel;

  UpdateUserFromHive({required this.userModel});
  @override
  Future<UserEntity?> updateUser() async {
    try {
    await  StoreUserByHive().storeUser(userEntity: userModel);
    print('-------------------');
      return userModel;
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnKnownProblemMessage);
      return null;
    }
  }
}
