import 'package:code_grapper/imports.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'profile_state.g.dart';

@CopyWith()
class ProfileState extends ParentState {
  final ProfileResponseModel? profileResponseModel;
  Status savingStatus;

  ProfileState({this.profileResponseModel, this.savingStatus = Status.initial});

  @override
  List<Object?> get props => [profileResponseModel, savingStatus];
}
