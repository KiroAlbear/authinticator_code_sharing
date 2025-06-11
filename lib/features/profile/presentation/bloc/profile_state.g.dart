// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileStateCWProxy {
  ProfileState profileResponseModel(ProfileResponseModel? profileResponseModel);

  ProfileState savingStatus(Status savingStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileState call({
    ProfileResponseModel? profileResponseModel,
    Status? savingStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfileState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfileState.copyWith.fieldName(...)`
class _$ProfileStateCWProxyImpl implements _$ProfileStateCWProxy {
  const _$ProfileStateCWProxyImpl(this._value);

  final ProfileState _value;

  @override
  ProfileState profileResponseModel(
          ProfileResponseModel? profileResponseModel) =>
      this(profileResponseModel: profileResponseModel);

  @override
  ProfileState savingStatus(Status savingStatus) =>
      this(savingStatus: savingStatus);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileState call({
    Object? profileResponseModel = const $CopyWithPlaceholder(),
    Object? savingStatus = const $CopyWithPlaceholder(),
  }) {
    return ProfileState(
      profileResponseModel: profileResponseModel == const $CopyWithPlaceholder()
          ? _value.profileResponseModel
          // ignore: cast_nullable_to_non_nullable
          : profileResponseModel as ProfileResponseModel?,
      savingStatus:
          savingStatus == const $CopyWithPlaceholder() || savingStatus == null
              ? _value.savingStatus
              // ignore: cast_nullable_to_non_nullable
              : savingStatus as Status,
    );
  }
}

extension $ProfileStateCopyWith on ProfileState {
  /// Returns a callable class that can be used as follows: `instanceOfProfileState.copyWith(...)` or like so:`instanceOfProfileState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProfileStateCWProxy get copyWith => _$ProfileStateCWProxyImpl(this);
}
