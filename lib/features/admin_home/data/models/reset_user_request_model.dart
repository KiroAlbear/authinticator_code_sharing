class ResetUserRequestModel {
  final String email;
  final String userCode;

  ResetUserRequestModel({
    required this.email,
    required this.userCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'userCode': userCode,
    };
  }
}
