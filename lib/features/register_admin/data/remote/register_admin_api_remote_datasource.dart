import 'package:code_grapper/imports.dart';

abstract class RegisterAdminRemoteDataSource {
  FutureEither<ProfileResponseModel> registerAdmin(
      RegisterAdminRequestModel requestModel);
}

class RegisterAdminRemoteDataSourceImpl extends ApiHelper
    implements RegisterAdminRemoteDataSource {
  @override
  FutureEither<ProfileResponseModel> registerAdmin(
      RegisterAdminRequestModel requestModel) {
    return postData<ProfileResponseModel>(
      Urls.addNewAdmin,
      body: requestModel.toJson(),
      responseConverter: ProfileResponseModel.fromJson,
    );
  }
}
