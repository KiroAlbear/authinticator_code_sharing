import 'package:code_grapper/core/models/error_handling_models/failure.dart';
import 'package:code_grapper/imports.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockApiService extends Mock implements ApiService {}

class ConcreteApiHelper extends ApiHelper {}

void main() {
  late ApiService apiService;
  late ApiHelper apiHelper;

  setUp(() {
    apiHelper = ConcreteApiHelper();
    apiService = MockApiService();
  });

  test('test apiHelper.fetchData for success', () async {
    final uri =
        'https://balance-project-29bd527336fc.herokuapp.com/getAllUsers';
    final responseData = '{"data":"John"}';
    when(() => apiService.get(any(), body: any(named: 'body'))).thenAnswer(
        (_) async => Response(
            data: responseData,
            statusCode: 200,
            requestOptions: RequestOptions(path: uri)));

    final Either<Failure, Object> result =
        await apiHelper.fetchData<Object, Object>(
      uri,
      responseConverter: (json) => json,
      testingApiService: apiService,
    );

    expect(result, Right("John"));
  });

  test('test apiHelper.fetchData for failure', () async {
    final uri =
        'https://balance-project-29bd527336fc.herokuapp.com/getAllUsers';
    final responseData = '{}';
    when(() => apiService.get(any(), body: any(named: 'body'))).thenAnswer(
        (_) async => Response(
            data: responseData,
            statusCode: 400,
            requestOptions: RequestOptions(path: uri)));

    final Either<Failure, Object> result =
        await apiHelper.fetchData<Object, Object>(
      uri,
      responseConverter: (json) => json,
      testingApiService: apiService,
    );

    result.fold((l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<Object>()));
  });
}
