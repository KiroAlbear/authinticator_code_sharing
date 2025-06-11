// import 'dart:convert';

import 'package:code_grapper/imports.dart';

abstract class AdminHomeRemoteDataSource {
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

class AdminHomeDataRemoteDataSourceImpl extends ApiHelper
    implements AdminHomeRemoteDataSource {
  @override
  FutureEither<AdminHomeResponseModel> getAdminHomeData(
      AdminHomeRequestModel requestModel) {
    return postData<AdminHomeResponseModel>(
      Urls.getAllAdminUsers,
      body: requestModel.toJson(),
      responseConverter: AdminHomeResponseModel.fromJson,
    );
  }

  @override
  FutureEither<UserResponseModel> enableDisableUser(
      EnableDisableUserRequestModel requestModel) {
    return postData<UserResponseModel>(
      Urls.enableDisableUser,
      body: requestModel.toJson(),
      responseConverter: UserResponseModel.fromJson,
    );
  }

  @override
  FutureEither<UserResponseModel> resetUser(
      ResetUserRequestModel requestModel) {
    return postData<UserResponseModel>(
      Urls.resetUser,
      body: requestModel.toJson(),
      responseConverter: UserResponseModel.fromJson,
    );
  }

  @override
  FutureEither<AdminHomeResponseModel> deleteUser(
      DeleteUserRequestModel requestModel) {
    return postData<AdminHomeResponseModel>(
      Urls.deleteUser,
      body: requestModel.toJson(),
      responseConverter: AdminHomeResponseModel.fromJson,
    );
  }

  @override
  FutureEither<AdminHomeResponseModel> enableDisableAllUsers(
      EnableDisableAllUsersRequestModel requestModel) {
    return postData<AdminHomeResponseModel>(
      Urls.enableDisableAllAdminUsers,
      body: requestModel.toJson(),
      responseConverter: AdminHomeResponseModel.fromJson,
    );
  }
}
