import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:key_bridge/imports.dart';

part 'profile_state.g.dart';

@CopyWith()
class ProfileState extends ParentState {
  final ProfileResponseModel? profileResponseModel;
  Status savingStatus;

  ProfileState({this.profileResponseModel, this.savingStatus = Status.initial});

  @override
  List<Object?> get props => [profileResponseModel, savingStatus];
}
