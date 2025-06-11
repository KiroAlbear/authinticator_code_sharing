class RegisterUserRequestModel {
  final String name;
  final String startDate;
  final String endDate;
  final String email;
  final String? phone;

  RegisterUserRequestModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'email': email,
      'phone': phone,
    };
  }
}
