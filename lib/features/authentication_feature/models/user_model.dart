import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.firstName,
      required super.lastName,
      required super.id,
      required super.email,
      required super.token,
      required super.expireDate,
      required super.avatarUrl,
      required super.phoneNumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        lastName: json['lastName'],
        firstName: json['firstName'],
        id: json['id'],
        email: json['email'],
        token: json['token'],
        expireDate: json['expiration'],
        avatarUrl: json['profilePictureUrl'],
        phoneNumber: json['phoneNumber']);
  }

  Map<String, dynamic> toJson() {
    return {
      'lastName': lastName,
      'firstName': firstName,
      'id': id,
      'email': email,
      'profilePictureUrl': avatarUrl,
      'phoneNumber': phoneNumber
    };
  }
}
