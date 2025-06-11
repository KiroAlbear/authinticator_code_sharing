import 'package:code_grapper/imports.dart';

class JsonToListConverter {
  JsonToListConverter._();

  static convertJsonToList<T, B>(ApiResponseModel apiResponseModel,
      Function(Map<String, dynamic>) fromJson) {
    List<Map<String, dynamic>> result =
        apiResponseModel.data.cast<Map<String, dynamic>>();
    List<B> list = <B>[];

    for (int i = 0; i < result.length; i++) {
      list.add(fromJson(result[i]));
    }
    return list as T;
  }
}
