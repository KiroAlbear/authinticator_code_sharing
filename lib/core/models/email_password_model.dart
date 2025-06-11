class EmailPasswordModel {
  String email;
  String password;

  EmailPasswordModel({
    required this.email,
    required this.password,
  });

  factory EmailPasswordModel.fromJson(Map<String, dynamic> json) {
    return EmailPasswordModel(
      email: json["email"] as String,
      password: json["password"] as String,
    );
  }

  // Convert EmailPasswordModel to JSON
  Map<String, dynamic> toJson() {
    return {
      "\"email\"": "\"$email\"",
      "\"password\"": "\"$password\"",
    };
  }
}
