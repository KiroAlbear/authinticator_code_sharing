import 'package:equatable/equatable.dart';
import 'package:key_bridge/features/profile/data/models/profile_request_model.dart';
import 'package:key_bridge/features/profile/data/models/update_profile_request_model.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => <Object>[];
}

class getProfileEvent extends ProfileEvent {
  final ProfileRequestModel profileRequestModel;

  const getProfileEvent(this.profileRequestModel);

  @override
  List<Object> get props => <Object>[profileRequestModel];
}

class updateProfileEvent extends ProfileEvent {
  final UpdateProfileRequestModel updateAdminRequestModel;

  const updateProfileEvent(this.updateAdminRequestModel);

  @override
  List<Object> get props => <Object>[updateAdminRequestModel];
}
