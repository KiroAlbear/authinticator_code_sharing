import '../../../../imports.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _dataSource;

  LoginRepositoryImpl(this._dataSource);

  @override
  FutureEither<LoginResponseModel> login(LoginRequestModel requestModel) async {
    return _dataSource.login(requestModel);
  }
}
