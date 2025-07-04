import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:key_bridge/imports.dart';

part 'register_admin_state.g.dart';

@CopyWith()
class RegisterAdminState extends ParentState {
  ProfileResponseModel? profileResponseModel;
  bool isVerified;

  RegisterAdminState({
    this.profileResponseModel,
    this.isVerified = false,
    super.status = Status.success,
  }) : super();

  @override
  List<Object?> get props => [profileResponseModel, isVerified];
}
