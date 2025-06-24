class RegisterAdminRequestModel {
  final String adminUserName;
  final String adminPassword;
  String verificationCode;
  final String secretKey;

  RegisterAdminRequestModel({
    required this.adminUserName,
    required this.adminPassword,
    required this.verificationCode,
    required this.secretKey,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adminUserName': adminUserName,
      'adminPassword': adminPassword,
      'verificationCode': verificationCode,
      'secretKey': secretKey,
    };
  }
}
