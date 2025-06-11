class RegisterAdminRequestModel {
  final String adminUserName;
  final String adminPassword;
  final String secretKey;

  RegisterAdminRequestModel({
    required this.adminUserName,
    required this.adminPassword,
    required this.secretKey,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adminUserName': adminUserName,
      'adminPassword': adminPassword,
      'secretKey': secretKey,
    };
  }
}
