import 'package:deaf_gain/core/services/dio_service.dart';
import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../../core/services/failure_service.dart';
import '../../../core/utils/component/toast_message_function.dart';
import '../../authentication_feature/entities/user_entity.dart';
import '../../authentication_feature/models/user_model.dart';

abstract class GetUserRepository {
  UserEntity? getUser();
}

class GetUserFromHive implements GetUserRepository {
  @override
  UserEntity? getUser()  {
    try {
      var box = Hive.box(kUsersBox);
      UserEntity? userEntity =
           box.get(kUser, defaultValue: []);
      return userEntity;
    }  catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnKnownProblemMessage);
      return null;
    }
  }

  static bool isUserStored() {
    try {
      var box = Hive.box(kUsersBox);
      final user = box.get(kUser);
      return user != null && user is UserEntity;
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnKnownProblemMessage);
      return false;
    }
  }
}
