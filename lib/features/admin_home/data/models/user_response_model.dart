class UserResponseModel {
  final String email;
  final String phone;
  final String userCode;
  final String? lastLoginCode;
  final int loginCounter;
  final String? lastLoginDate;
  final String? firstLoginDate;
  final String? expiryDate;
  final bool isActive;
  bool isMaximumCodesReached;

  UserResponseModel({
    required this.email,
    required this.phone,
    required this.userCode,
    this.lastLoginCode,
    required this.loginCounter,
    this.lastLoginDate,
    this.firstLoginDate,
    this.expiryDate,
    required this.isActive,
    required this.isMaximumCodesReached,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      email: json['email'],
      phone: json['phone'],
      userCode: json['userCode'],
      lastLoginCode: json['lastLoginCode'],
      loginCounter: json['loginCounter'],
      lastLoginDate: json['lastLoginDate'],
      firstLoginDate: json['firstLoginDate'],
      expiryDate: json['expiryDate'],
      isActive: json['isActive'] == 1 ? true : false,
      isMaximumCodesReached: json['isMaximumCodesReached'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'lastLoginCode': lastLoginCode,
      'loginCounter': loginCounter,
      'lastLoginDate': lastLoginDate,
      'firstLoginDate': firstLoginDate,
      'expiryDate': expiryDate,
      'isActive': isActive,
      'isMaximumCodesReached': isMaximumCodesReached,
    };
  }
}
