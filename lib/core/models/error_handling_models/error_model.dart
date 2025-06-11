class ErrorModel {
  final String message;

  const ErrorModel({required this.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['detail'],
    );
  }
}
