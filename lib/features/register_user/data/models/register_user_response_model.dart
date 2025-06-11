class RegisterUserResponseModel {
  final String userCode;
  final String email;
  final String name;
  final String phone;
  final String startDate;
  final String endDate;
  final int daysLeft;
  final String? lastLoginCode;
  final int loginCounter;
  final String? lastLoginDate;
  final String? firstLoginDate;
  final String? expiryDate;
  final bool isActive;
  final bool isMaximumCodesReached;

  RegisterUserResponseModel({
    required this.userCode,
    required this.email,
    required this.name,
    required this.phone,
    required this.startDate,
    required this.endDate,
    required this.daysLeft,
    this.lastLoginCode,
    required this.loginCounter,
    this.lastLoginDate,
    this.firstLoginDate,
    this.expiryDate,
    required this.isActive,
    required this.isMaximumCodesReached,
  });

  factory RegisterUserResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserResponseModel(
      userCode: json['userCode'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      daysLeft: json['daysLeft'],
      lastLoginCode: json['lastLoginCode'],
      loginCounter: json['loginCounter'],
      lastLoginDate: json['lastLoginDate'],
      firstLoginDate: json['firstLoginDate'],
      expiryDate: json['expiryDate'],
      isActive: json['isActive'] == 1,
      isMaximumCodesReached: json['isMaximumCodesReached'],
    );
  }
}
