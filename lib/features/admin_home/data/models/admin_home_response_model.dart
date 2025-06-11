class AdminHomeResponseModel {
  final List<User> usersList;

  AdminHomeResponseModel({required this.usersList});

  factory AdminHomeResponseModel.fromJson(Map<String, dynamic> json) {
    return AdminHomeResponseModel(
      usersList: (json['usersList'] as List)
          .map((userJson) => User.fromJson(userJson))
          .toList(),
    );
  }
}

class User {
  final String userCode;
  final String email;
  final String name;
  final String userPhone;
  String? expiryDate;
  final int daysLeft;
  final String? lastLoginDate;
  final String? firstLoginDate;
  final String? startDate;
  final String? endDate;

  int? loginCount;
  bool isActive;
  bool isMaximumCodesReached;

  User({
    required this.userCode,
    required this.email,
    required this.userPhone,
    required this.name,
    this.expiryDate,
    required this.daysLeft,
    this.lastLoginDate,
    this.firstLoginDate,
    required this.loginCount,
    required this.isActive,
    required this.isMaximumCodesReached,
    this.startDate,
    this.endDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userCode: json['userCode'] ?? '',
      email: json['email'] ?? '',
      name: json['name'],
      userPhone: json['userPhone'] ?? '',
      expiryDate: json['expiryDate'],
      daysLeft: json['daysLeft'] ?? '',
      lastLoginDate: json['lastLoginDate'],
      firstLoginDate: json['firstLoginDate'],
      loginCount: json['loginCount'] ?? 0,
      isActive: json['isActive'] == 1 ? true : false,
      isMaximumCodesReached: json['isMaximumCodesReached'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
}
