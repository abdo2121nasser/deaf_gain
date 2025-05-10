import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.firstName, required super.lastName, required super.id, required super.email});


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      lastName: json['lastName'],
      firstName: json['firstName'],
      id: json['id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastName': lastName,
      'firstName': firstName,
      'id': id,
      'email': email,
    };
  }

}

