class DeleteUserRequestModel {
  final String email;
  final String password;
  final String userCode;

  DeleteUserRequestModel({
    required this.email,
    required this.password,
    required this.userCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'userCode': userCode,
    };
  }
}
