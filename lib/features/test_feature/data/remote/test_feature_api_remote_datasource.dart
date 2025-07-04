// import 'dart:convert';

import 'package:key_bridge/imports.dart';

abstract class TestFeatureRemoteDataSource {
  FutureEither<ApiResponseModel> getTestFeatureData();

  FutureEither<ApiResponseModel> addTestFeatureData(
      TestFeatureRequestModel requestModel);
}

class TestFeatureDataRemoteDataSourceImpl extends ApiHelper
    implements TestFeatureRemoteDataSource {
  @override
  FutureEither<ApiResponseModel> addTestFeatureData(
      TestFeatureRequestModel requestModel) {
    return postData<ApiResponseModel>(
      "TestFeature Url",
      body: requestModel.toJson(),
      responseConverter: ApiResponseModel.fromJson,
    );
  }

  @override
  FutureEither<ApiResponseModel> getTestFeatureData() {
    return fetchData<ApiResponseModel, Object>(
      "TestFeature Url",
      responseConverter: TestFeatureRequestModel.fromJson,
    );
  }
}
