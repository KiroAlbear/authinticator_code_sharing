class EnableDisableUserRequestModel {
  final String email;
  final String userCode;
  final bool isActive;

  EnableDisableUserRequestModel({
    required this.email,
    required this.userCode,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'userCode': userCode,
      'isActive': isActive
    };
  }
}
