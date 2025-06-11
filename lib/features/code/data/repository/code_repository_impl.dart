import '../../../../imports.dart';

class CodeRepositoryImpl extends CodeRepository {
  final CodeRemoteDataSource _dataSource;

  CodeRepositoryImpl(this._dataSource);

  @override
  FutureEither<CodeResponseModel> requestCode(
      CodeRequestModel requestModel) async {
    return _dataSource.requestCode(requestModel);
  }
}
