class SignUpEntity {
  SignUpEntity({
    required this.birthday,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phoneNumber,
    required this.confirmPassword,
    required this.email,
  });

  DateTime birthday;
  String firstName;
  String lastName;
  String password;
  String phoneNumber;
  String confirmPassword;
  String email;
}
