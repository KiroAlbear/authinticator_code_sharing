class EnableDisableAllUsersRequestModel {
  final String email;
  final String password;
  final bool isActive;

  EnableDisableAllUsersRequestModel({
    required this.email,
    required this.password,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'isActive': isActive
    };
  }
}
