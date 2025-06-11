class ProfileResponseModel {
  final String adminUserName;
  final String adminPassword;
  final String secretKey;
  final String startDate;
  final String endDate;
  final int daysLeft;
  final int maxLoginPerPeriod;
  final int resetAfterDays;
  final bool isActive;

  ProfileResponseModel({
    required this.adminUserName,
    required this.adminPassword,
    required this.secretKey,
    required this.startDate,
    required this.endDate,
    required this.daysLeft,
    required this.maxLoginPerPeriod,
    required this.resetAfterDays,
    required this.isActive,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      adminUserName: json['adminUserName'],
      adminPassword: json['adminPassword'],
      secretKey: json['secretKey'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      daysLeft: json['daysLeft'],
      maxLoginPerPeriod: json['maxLoginPerPeriod'],
      resetAfterDays: json['resetAFterDays'],
      isActive: json['isActive'] == 1,
    );
  }
}
