import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/component/toast_message_function.dart';
import '../entities/user_entity.dart';

abstract class DeleteUserRepository {
  Future<void> deleteUser();
}

class DeleteUserFromHive implements DeleteUserRepository {
  @override
  Future<void> deleteUser() async {
    try {
      var box = Hive.box(kUsersBox);
      await box.clear();
    } catch (error) {
      debugPrint(error.toString());
      showToastMessage(message: kUnKnownProblemMessage);
    }
  }
}
