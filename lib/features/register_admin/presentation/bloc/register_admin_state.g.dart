// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_admin_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterAdminStateCWProxy {
  RegisterAdminState profileResponseModel(
      ProfileResponseModel? profileResponseModel);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterAdminState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterAdminState(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterAdminState call({
    ProfileResponseModel? profileResponseModel,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRegisterAdminState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRegisterAdminState.copyWith.fieldName(...)`
class _$RegisterAdminStateCWProxyImpl implements _$RegisterAdminStateCWProxy {
  const _$RegisterAdminStateCWProxyImpl(this._value);

  final RegisterAdminState _value;

  @override
  RegisterAdminState profileResponseModel(
          ProfileResponseModel? profileResponseModel) =>
      this(profileResponseModel: profileResponseModel);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RegisterAdminState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RegisterAdminState(...).copyWith(id: 12, name: "My name")
  /// ````
  RegisterAdminState call({
    Object? profileResponseModel = const $CopyWithPlaceholder(),
  }) {
    return RegisterAdminState(
      profileResponseModel: profileResponseModel == const $CopyWithPlaceholder()
          ? _value.profileResponseModel
          // ignore: cast_nullable_to_non_nullable
          : profileResponseModel as ProfileResponseModel?,
    );
  }
}

extension $RegisterAdminStateCopyWith on RegisterAdminState {
  /// Returns a callable class that can be used as follows: `instanceOfRegisterAdminState.copyWith(...)` or like so:`instanceOfRegisterAdminState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterAdminStateCWProxy get copyWith =>
      _$RegisterAdminStateCWProxyImpl(this);
}
