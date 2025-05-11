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
        lastName: json['user']['lastName'],
        firstName: json['user']['firstName'],
        id: json['user']['id'],
        email: json['user']['email'],
        token: json['token'],
        expireDate: json['expiration'],
        avatarUrl: json['user']['profilePictureUrl'],
        phoneNumber: json['user']['phoneNumber']);
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
// void printFullText(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the chunk size
//   pattern.allMatches(text).forEach((match) => print(match.group(0)));
// }