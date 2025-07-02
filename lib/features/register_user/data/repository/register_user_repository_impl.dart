import 'package:code_grapper/features/register_user/data/models/update_user_request_model.dart';

import '../../../../imports.dart';

class RegisterUserRepositoryImpl extends RegisterUserRepository {
  final RegisterUserRemoteDataSource _dataSource;

  RegisterUserRepositoryImpl(this._dataSource);

  @override
  FutureEither<RegisterUserResponseModel> registerUser(
      RegisterUserRequestModel requestModel) {
    return _dataSource.registerUser(requestModel);
  }

  @override
  FutureEither<RegisterUserResponseModel> updateUser(
      UpdateUserRequestModel requestModel) {
    return _dataSource.updateUser(requestModel);
  }

// @override
// FutureEither<RegisterUserCodeResponseModel> getUserCode(
//     RegisterUserResponseModel requestModel) {
//   return _dataSource.addUser(requestModel);
// }
}
