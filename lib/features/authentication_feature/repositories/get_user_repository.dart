import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/component/toast_message_function.dart';
import '../entities/user_entity.dart';

abstract class GetUserRepository {
  Future<UserEntity?> getUser({required UserEntity userEntity});
}

class GetUserFromHive implements GetUserRepository {
  @override
  Future<UserEntity?> getUser({required UserEntity userEntity}) async {
    try {
      var box = Hive.box(kUsersBox);
      UserEntity userEntity = await
          box.get(kUser, defaultValue: []).cast<UserEntity>();
      return userEntity;
    } catch (error) {
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
