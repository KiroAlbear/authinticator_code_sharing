import 'package:dartz/dartz.dart';
import '../../../../imports.dart';

abstract class TestFeatureRepository {
  FutureEither<ApiResponseModel> getTestFeatureData();

  FutureEither<ApiResponseModel> postTestFeatureData(
      Map<String, dynamic> body);
}
