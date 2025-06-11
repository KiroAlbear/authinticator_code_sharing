part of 'api_helper.dart';

abstract class ApiUtility {
  // Common utility method to handle API response status codes
  T _handleStatusCode<T, B>({
    required Response<dynamic> response,
    required Function(Map<String, dynamic> json) responseConverter,
  }) {
    if (response.statusCode == 200) {
      final ApiResponseModel apiResponse =
          ApiResponseModel.fromJson(json.decode(response.data));
      return _dataConverterHelper<T, B>(
        apiResponseModel: apiResponse,
        responseConverter: responseConverter,
      );
    } else {
      throw ServerException();
    }
  }

  dynamic _dataConverterHelper<T, B>({
    required ApiResponseModel apiResponseModel,
    required Function(Map<String, dynamic> json) responseConverter,
  }) {
    // try {
    if (apiResponseModel.data is Map<String, dynamic>) {
      return responseConverter(apiResponseModel.data);
    } else if (apiResponseModel.data is List) {
      return JsonToListConverter.convertJsonToList<T, B>(
          apiResponseModel, responseConverter);
    } else {
      return apiResponseModel.data;
    }
  }

  Exception _exceptionHandler(Exception e) {
    if (e is DioException) {
      switch (e.response?.statusCode) {
        case 400:
          return CustomException(
              message: [json.decode(e.response?.data)['detail'].toString()]);
        default:
          return ServerException();
      }
    }

    if ((e is ServerException) ||
        (e is CustomException) ||
        (e is DataParsingException)) {
      return e;
    } else if (e is FormatException) {
      return DataParsingException(message: 'Data format error');
    } else {
      return NoConnectionException();
    }
  }
}
