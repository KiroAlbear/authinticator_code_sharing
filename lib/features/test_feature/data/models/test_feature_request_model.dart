class TestFeatureRequestModel {
  final String username;
  final String password;

  TestFeatureRequestModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory TestFeatureRequestModel.fromJson(Map<String, dynamic> json) {
    return TestFeatureRequestModel(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }
}
