class UserDataModel {
  final String email;
  final String password;

  UserDataModel(this.email, this.password);

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(json['email'], json['password']);
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password
  };
}