import 'package:deaf_gain/core/utils/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../entities/user_entity.dart';

abstract class StoreUserRepository {
  Future<void> storeUser({required UserEntity userEntity});
}

class StoreUserByHive implements StoreUserRepository {
  @override
  Future<void> storeUser({required UserEntity userEntity}) async {
    try{
      final box = Hive.box(kUsersBox);
      // await box.clear();
      await box.put(kUser, userEntity);
    }catch(error){
      debugPrint(error.toString());
    }

  }
}
