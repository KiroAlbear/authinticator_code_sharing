// import 'dart:convert';

import 'package:code_grapper/imports.dart';

abstract class LoginRemoteDataSource {
  FutureEither<LoginResponseModel> login(LoginRequestModel requestModel);
}

class LoginDataRemoteDataSourceImpl extends ApiHelper
    implements LoginRemoteDataSource {
  @override
  FutureEither<LoginResponseModel> login(LoginRequestModel requestModel) {
    return postData<LoginResponseModel>(
      Urls.loginUserAdmin,
      body: requestModel.toJson(),
      responseConverter: LoginResponseModel.fromJson,
    );
  }
}
