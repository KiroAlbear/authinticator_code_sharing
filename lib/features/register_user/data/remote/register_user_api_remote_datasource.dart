import 'package:code_grapper/features/register_user/data/models/update_user_request_model.dart';
import 'package:code_grapper/imports.dart';

abstract class RegisterUserRemoteDataSource {
  FutureEither<RegisterUserResponseModel> registerUser(
      RegisterUserRequestModel requestModel);

  FutureEither<RegisterUserResponseModel> updateUser(
      UpdateUserRequestModel requestModel);
}

class RegisterUserDataRemoteDataSourceImpl extends ApiHelper
    implements RegisterUserRemoteDataSource {
  @override
  FutureEither<RegisterUserResponseModel> registerUser(
      RegisterUserRequestModel requestModel) {
    return postData<RegisterUserResponseModel>(
      Urls.registerUser,
      body: requestModel.toJson(),
      responseConverter: RegisterUserResponseModel.fromJson,
    );
  }

  @override
  FutureEither<RegisterUserResponseModel> updateUser(
      UpdateUserRequestModel requestModel) {
    return postData<RegisterUserResponseModel>(
      Urls.updateUser,
      body: requestModel.toJson(),
      responseConverter: RegisterUserResponseModel.fromJson,
    );
  }
}
