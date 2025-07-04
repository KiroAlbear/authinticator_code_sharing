import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:key_bridge/imports.dart';

part 'admin_home_state.g.dart';

@CopyWith()
class AdminHomeState extends ParentState {
  AdminHomeResponseModel? adminHomeResponseModel;
  UserResponseModel? userResponseModel;
  Status savingStatus;
  bool isChanged;

  AdminHomeState({
    this.adminHomeResponseModel,
    this.savingStatus = Status.success,
    this.userResponseModel,
    this.isChanged = false,
  }) : super(status: Status.loading, errorMessage: '');

  @override
  List<Object?> get props =>
      [adminHomeResponseModel, savingStatus, userResponseModel, isChanged];
}
