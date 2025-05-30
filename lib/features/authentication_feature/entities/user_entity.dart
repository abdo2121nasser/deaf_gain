import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  final String ?lastName;
  @HiveField(1)
  final String? firstName;
  @HiveField(2)
  final String? id;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? token;
  @HiveField(5)
  final String? expireDate;
  @HiveField(6)
  final String? avatarUrl;
  @HiveField(7)
  final String? phoneNumber;
  @HiveField(8)
   DateTime? subscriptionExpireDate;

  UserEntity(
      {required this.firstName,
      required this.lastName,
      required this.id,
      required this.email,
      required this.token,
      required this.expireDate,
        required this.avatarUrl,
        required this.phoneNumber,
        this.subscriptionExpireDate
      });
}
