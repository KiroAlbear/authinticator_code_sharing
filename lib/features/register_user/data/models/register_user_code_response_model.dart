class RegisterUserCodeResponseModel {
  final String generatedCode;

  RegisterUserCodeResponseModel({
    required this.generatedCode,
  });

  factory RegisterUserCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserCodeResponseModel(
      generatedCode: json['generatedCode'],
    );
  }
}
