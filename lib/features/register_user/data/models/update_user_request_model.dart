class UpdateUserRequestModel {
  final String name;
  final String userId;
  final String startDate;
  final String endDate;
  final String email;
  final String phone;

  UpdateUserRequestModel({
    required this.name,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'userId': userId,
      'startDate': startDate,
      'endDate': endDate,
      'email': email,
      'phone': phone,
    };
  }
}
