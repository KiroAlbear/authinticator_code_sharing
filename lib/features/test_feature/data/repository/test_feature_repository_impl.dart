
import '../../../../imports.dart';

class TestFeatureRepositoryImpl extends TestFeatureRepository {
  final TestFeatureRemoteDataSource _dataSource;
  TestFeatureRepositoryImpl(this._dataSource);

  @override
  FutureEither<ApiResponseModel> getTestFeatureData() async {
    return _dataSource.getTestFeatureData();
  }

  @override
  FutureEither<ApiResponseModel> postTestFeatureData(
      Map<String, dynamic> body) async {
    return _dataSource.getTestFeatureData();
  }
}
