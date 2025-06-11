import 'package:code_grapper/imports.dart';

abstract class RegisterUserRemoteDataSource {
  // FutureEither<RegisterUserCodeResponseModel> getUserCode(
  //     RegisterUserResponseModel requestModel);

  FutureEither<RegisterUserResponseModel> addUser(
      RegisterUserRequestModel requestModel);
}

class RegisterUserDataRemoteDataSourceImpl extends ApiHelper
    implements RegisterUserRemoteDataSource {
  @override
  FutureEither<RegisterUserResponseModel> addUser(
      RegisterUserRequestModel requestModel) {
    return postData<RegisterUserResponseModel>(
      Urls.registerUser,
      body: requestModel.toJson(),
      responseConverter: RegisterUserResponseModel.fromJson,
    );
  }

// @override
// FutureEither<RegisterUserCodeResponseModel> getUserCode(
//     RegisterUserResponseModel requestModel) {
//   return postData<RegisterUserCodeResponseModel>(
//     Urls.getAdminRegisterUserData,
//     body: requestModel.toJson(),
//     responseConverter: RegisterUserCodeResponseModel.fromJson,
//   );
// }
}
