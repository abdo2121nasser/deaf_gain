import '../entities/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
    required super.birthday,
    required super.firstName,
    required super.lastName,
    required super.password,
    required super.phoneNumber,
    required super.confirmPassword,
    required super.email,
  });

  factory SignUpModel.fromJson(Map<dynamic, dynamic> json) => SignUpModel(
        birthday: DateTime.parse(json["birthday"]),
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        confirmPassword: json["confirmPassword"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "phoneNumber": phoneNumber,
        "confirmPassword": confirmPassword,
        "email": email,
      };
}
