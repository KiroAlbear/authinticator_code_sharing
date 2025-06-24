import 'package:code_grapper/imports.dart';

abstract class RegisterAdminRemoteDataSource {
  FutureEither<ApiResponseModel> sendEmail(String email);

  FutureEither<ProfileResponseModel> registerAdmin(
      RegisterAdminRequestModel requestModel);
}

class RegisterAdminRemoteDataSourceImpl extends ApiHelper
    implements RegisterAdminRemoteDataSource {
  @override
  FutureEither<ProfileResponseModel> registerAdmin(
      RegisterAdminRequestModel requestModel) {
    return postData<ProfileResponseModel>(
      Urls.verifyAndAddNewAdmin,
      body: requestModel.toJson(),
      responseConverter: ProfileResponseModel.fromJson,
    );
  }

  @override
  FutureEither<ApiResponseModel> sendEmail(String email) {
    return postData<ApiResponseModel>(
      Urls.sendEmail(email),
      responseConverter: ApiResponseModel.fromJson,
    );
  }
}
