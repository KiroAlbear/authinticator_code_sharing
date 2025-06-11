class CodeRequestModel {
  final String email;
  final String userCode;

  CodeRequestModel({
    required this.email,
    required this.userCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'userCode': userCode,
    };
  }

  factory CodeRequestModel.fromJson(Map<String, dynamic> json) {
    return CodeRequestModel(
      email: json['email'] as String,
      userCode: json['userCode'] as String,
    );
  }
}
