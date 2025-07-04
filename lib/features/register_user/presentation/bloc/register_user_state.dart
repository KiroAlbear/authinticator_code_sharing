import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:key_bridge/imports.dart';

part 'register_user_state.g.dart';

@CopyWith()
class RegisterUserState extends ParentState {
  final RegisterUserResponseModel? registerUserResponseModel;
  Status savingStatus;

  RegisterUserState(
      {this.registerUserResponseModel,
      this.savingStatus = Status.success,
      super.status = Status.success});

  @override
  List<Object?> get props => [registerUserResponseModel, savingStatus];
}
