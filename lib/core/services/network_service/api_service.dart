import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../imports.dart';

class ApiService {
  static Dio dio = Dio();
  static ApiService? _instance;
  final int callAttempts = 3;

  static ApiService getInstance() {
    if (_instance == null) {
      BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        // sendTimeout: const Duration(seconds: 30),
      );

      dio.httpClientAdapter = HttpClientAdapter();
      dio.options = options;
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ));

      _instance = ApiService();
    }
    return _instance!;
  }

  Future<Response<dynamic>> get(String uri, {Object? body}) async {
    try {
      Response<dynamic> res = await dio.get(
        uri,
        data: body,
        options: _getOption(),
      );

      return res;
    } catch (ex) {
      LoggerService.logError("APISERVICE ON ERROR$ex${StackTrace.current}");
      rethrow;
    }
  }

  Future<Response<dynamic>> post(String uri,
      {Map<String, dynamic>? body}) async {
    try {
      Object? data = body;
      Response<dynamic> res = await dio.post(
        uri,
        data: data,
        options: _getOption(),
      );
      return res;
    } catch (ex) {
      LoggerService.logError("APISERVICE ON ERROR$ex${StackTrace.current}");
      rethrow;
    }
  }

  Options _getOption() {
    return Options(
      headers: _getHeaders(),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.plain,
    );
  }

  Map<String, Object> _getHeaders() {
    Map<String, Object> headers = <String, Object>{
      'Content-Type': 'application/json',
      'Accept': '*/*',
      // 'AgentType': Platform.isAndroid ? 2 : 1,
    };

    return headers;
  }
}
