import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  String? lastName;
  @HiveField(1)
  String? firstName;

  @HiveField(2)
  String? id;

  @HiveField(3)
  String? email;

  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.email,
  });

}
