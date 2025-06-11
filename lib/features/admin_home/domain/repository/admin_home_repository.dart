import '../../../../imports.dart';

abstract class AdminHomeRepository {
  FutureEither<AdminHomeResponseModel> getAdminHomeData(
      AdminHomeRequestModel requestModel);

  FutureEither<UserResponseModel> enableDisableUser(
      EnableDisableUserRequestModel requestModel);

  FutureEither<UserResponseModel> resetUser(ResetUserRequestModel requestModel);

  FutureEither<AdminHomeResponseModel> deleteUser(
      DeleteUserRequestModel requestModel);

  FutureEither<AdminHomeResponseModel> enableDisableAllUsers(
      EnableDisableAllUsersRequestModel requestModel);
}
