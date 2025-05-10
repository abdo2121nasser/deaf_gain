class SignInModel {
  final String email;
  final String password;
  final bool rememberMe=true;

  SignInModel(
      {
        required this.email,
        required this.password});

  factory SignInModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return SignInModel(
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['rememberMe']=rememberMe;
    return data;
  }
}
