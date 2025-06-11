import 'dart:convert';

import 'package:code_grapper/core/utils/typedef.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../imports.dart';

part 'api_utility.dart';

abstract class ApiHelper extends ApiUtility {
  FutureEither<T> postData<T>(
    String path, {
    Map<String, dynamic>? body,
    required T Function(Map<String, dynamic> json) responseConverter,
    Type? listType,
  }) async {
    return _executeApiCall<T>(
      () async {
        try {
          final Response<dynamic> response =
              await ApiService.getInstance().post(
            path,
            body: body,
          );

          return _handleStatusCode(
            response: response,
            responseConverter: responseConverter,
          );
        } catch (error) {
          LoggerService.logError(error.toString());
          Exception exception = _exceptionHandler(error as Exception);
          throw exception;
        }
      },
    );
  }

  FutureEither<T> fetchData<T, B>(
    String path, {
    Object? body,
    required Function(Map<String, dynamic> json) responseConverter,
    ApiService? testingApiService,
  }) async {
    return _executeApiCall<T>(
      () async {
        try {
          testingApiService ??= ApiService.getInstance();
          final Response<dynamic> response = await testingApiService!.get(
            path,
            body: body,
          );

          return _handleStatusCode<T, B>(
            response: response,
            responseConverter: responseConverter,
          );
        } catch (error) {
          LoggerService.logError(error.toString());
          Exception exception = _exceptionHandler(error as Exception);
          throw exception;
        }
      },
    );
  }

  FutureEither<T> _executeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      T data = await apiCall();
      return right(data);
    } on ServerException {
      return const Left<Failure, Never>(ServerFailure());
    } on DataParsingException catch (e) {
      return Left<Failure, Never>(DataParsingFailure(e.message));
    } on CustomException catch (customExceptionObject) {
      return Left<Failure, Never>(CustomFailure(customExceptionObject.message));
    } on NoConnectionException {
      return const Left<Failure, Never>(NoConnectionFailure());
    } on TooManyRequestsException {
      return Left<Failure, Never>(TooManyRequestsFailure());
    }
  }
}
