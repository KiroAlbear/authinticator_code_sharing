// import 'dart:convert';

import 'package:key_bridge/imports.dart';

abstract class CodeRemoteDataSource {
  FutureEither<CodeResponseModel> requestCode(CodeRequestModel requestModel);
}

class CodeDataRemoteDataSourceImpl extends ApiHelper
    implements CodeRemoteDataSource {
  @override
  FutureEither<CodeResponseModel> requestCode(CodeRequestModel requestModel) {
    return postData<CodeResponseModel>(
      Urls.requestUserCode,
      body: requestModel.toJson(),
      responseConverter: CodeResponseModel.fromJson,
    );
  }
}
