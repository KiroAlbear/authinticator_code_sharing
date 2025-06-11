class LoginResponseModel {
  final bool isAdmin;

  LoginResponseModel({
    required this.isAdmin,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      isAdmin: json['isAdmin'] as bool,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponseModel && other.isAdmin == isAdmin;
  }
}
