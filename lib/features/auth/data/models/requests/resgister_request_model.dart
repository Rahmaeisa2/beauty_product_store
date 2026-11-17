class SignupRequestModel {
  final String username;
  final String password;
  final String Name;
  final String email;

  SignupRequestModel({
    required this.username,
    required this.password,
    required this.Name,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'firstName': Name,
      'email': email,
    };
  }
}