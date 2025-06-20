class UpdateProfileRequestModel {
  final String adminUserName;
  final String adminPassword;
  final String secretKey;
  final int maxLoginPerPeriod;
  final int resetAfterDays;

  UpdateProfileRequestModel({
    required this.adminUserName,
    required this.adminPassword,
    required this.secretKey,
    required this.maxLoginPerPeriod,
    this.resetAfterDays = 10000, // Default value if not provided
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adminUserName': adminUserName,
      'adminPassword': adminPassword,
      'secretKey': secretKey,
      'maxLoginPerPeriod': maxLoginPerPeriod,
      'resetAFterDays': resetAfterDays,
    };
  }
}
