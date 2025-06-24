import '../../../../imports.dart';

class RegisterAdminRepositoryImpl extends RegisterAdminRepository {
  final RegisterAdminRemoteDataSource _dataSource;

  RegisterAdminRepositoryImpl(this._dataSource);

  @override
  FutureEither<ProfileResponseModel> registerAdmin(
      RegisterAdminRequestModel requestModel) {
    return _dataSource.registerAdmin(requestModel);
  }

  @override
  FutureEither<ApiResponseModel> sendEmail(String email) {
    return _dataSource.sendEmail(email);
  }
}
