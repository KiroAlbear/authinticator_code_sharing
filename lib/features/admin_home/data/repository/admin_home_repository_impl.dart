import '../../../../imports.dart';

class AdminHomeRepositoryImpl extends AdminHomeRepository {
  final AdminHomeRemoteDataSource _dataSource;

  AdminHomeRepositoryImpl(this._dataSource);

  @override
  FutureEither<AdminHomeResponseModel> getAdminHomeData(
      AdminHomeRequestModel requestModel) {
    return _dataSource.getAdminHomeData(requestModel);
  }

  @override
  FutureEither<UserResponseModel> enableDisableUser(
      EnableDisableUserRequestModel requestModel) {
    return _dataSource.enableDisableUser(requestModel);
  }

  @override
  FutureEither<UserResponseModel> resetUser(
      ResetUserRequestModel requestModel) {
    return _dataSource.resetUser(requestModel);
  }

  @override
  FutureEither<AdminHomeResponseModel> deleteUser(
      DeleteUserRequestModel requestModel) {
    return _dataSource.deleteUser(requestModel);
  }

  @override
  FutureEither<AdminHomeResponseModel> enableDisableAllUsers(
      EnableDisableAllUsersRequestModel requestModel) {
    return _dataSource.enableDisableAllUsers(requestModel);
  }
}
