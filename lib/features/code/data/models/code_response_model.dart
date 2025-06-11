class CodeResponseModel {
  final String code;

  CodeResponseModel({
    required this.code,
  });

  factory CodeResponseModel.fromJson(Map<String, dynamic> json) {
    return CodeResponseModel(
      code: json['code'] as String,
    );
  }
}
