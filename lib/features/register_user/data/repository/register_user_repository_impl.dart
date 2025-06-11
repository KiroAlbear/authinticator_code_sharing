import '../../../../imports.dart';

class RegisterUserRepositoryImpl extends RegisterUserRepository {
  final RegisterUserRemoteDataSource _dataSource;

  RegisterUserRepositoryImpl(this._dataSource);

  @override
  FutureEither<RegisterUserResponseModel> getRegisterUserData(
      RegisterUserRequestModel requestModel) {
    return _dataSource.addUser(requestModel);
  }

// @override
// FutureEither<RegisterUserCodeResponseModel> getUserCode(
//     RegisterUserResponseModel requestModel) {
//   return _dataSource.addUser(requestModel);
// }
}
