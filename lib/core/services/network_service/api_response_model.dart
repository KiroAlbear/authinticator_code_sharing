class ApiResponseModel {
  var data;
  int? count;
  List<String>? errorMessages;
  ApiResponseModel({this.count, this.data, this.errorMessages});

  ApiResponseModel.fromJson(Map<String, dynamic> jsonObject) {
    data = jsonObject['data']??"";
    count = jsonObject['count'] ?? 0;
    if (jsonObject['errors'] != null) {
      errorMessages = <String>[];
      jsonObject['errors'].forEach((dynamic v) {
        errorMessages!.add(v);
      });
    }
  }
}
