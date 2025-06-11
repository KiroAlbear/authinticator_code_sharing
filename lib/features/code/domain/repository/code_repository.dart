import '../../../../imports.dart';

abstract class CodeRepository {
  FutureEither<CodeResponseModel> requestCode(CodeRequestModel requestModel);
}
