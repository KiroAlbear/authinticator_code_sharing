// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_home_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdminHomeStateCWProxy {
  AdminHomeState adminHomeResponseModel(
      AdminHomeResponseModel? adminHomeResponseModel);

  AdminHomeState savingStatus(Status savingStatus);

  AdminHomeState userResponseModel(UserResponseModel? userResponseModel);

  AdminHomeState isChanged(bool isChanged);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AdminHomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AdminHomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  AdminHomeState call({
    AdminHomeResponseModel? adminHomeResponseModel,
    Status? savingStatus,
    UserResponseModel? userResponseModel,
    bool? isChanged,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAdminHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAdminHomeState.copyWith.fieldName(...)`
class _$AdminHomeStateCWProxyImpl implements _$AdminHomeStateCWProxy {
  const _$AdminHomeStateCWProxyImpl(this._value);

  final AdminHomeState _value;

  @override
  AdminHomeState adminHomeResponseModel(
          AdminHomeResponseModel? adminHomeResponseModel) =>
      this(adminHomeResponseModel: adminHomeResponseModel);

  @override
  AdminHomeState savingStatus(Status savingStatus) =>
      this(savingStatus: savingStatus);

  @override
  AdminHomeState userResponseModel(UserResponseModel? userResponseModel) =>
      this(userResponseModel: userResponseModel);

  @override
  AdminHomeState isChanged(bool isChanged) => this(isChanged: isChanged);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AdminHomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AdminHomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  AdminHomeState call({
    Object? adminHomeResponseModel = const $CopyWithPlaceholder(),
    Object? savingStatus = const $CopyWithPlaceholder(),
    Object? userResponseModel = const $CopyWithPlaceholder(),
    Object? isChanged = const $CopyWithPlaceholder(),
  }) {
    return AdminHomeState(
      adminHomeResponseModel:
          adminHomeResponseModel == const $CopyWithPlaceholder()
              ? _value.adminHomeResponseModel
              // ignore: cast_nullable_to_non_nullable
              : adminHomeResponseModel as AdminHomeResponseModel?,
      savingStatus:
          savingStatus == const $CopyWithPlaceholder() || savingStatus == null
              ? _value.savingStatus
              // ignore: cast_nullable_to_non_nullable
              : savingStatus as Status,
      userResponseModel: userResponseModel == const $CopyWithPlaceholder()
          ? _value.userResponseModel
          // ignore: cast_nullable_to_non_nullable
          : userResponseModel as UserResponseModel?,
      isChanged: isChanged == const $CopyWithPlaceholder() || isChanged == null
          ? _value.isChanged
          // ignore: cast_nullable_to_non_nullable
          : isChanged as bool,
    );
  }
}

extension $AdminHomeStateCopyWith on AdminHomeState {
  /// Returns a callable class that can be used as follows: `instanceOfAdminHomeState.copyWith(...)` or like so:`instanceOfAdminHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdminHomeStateCWProxy get copyWith => _$AdminHomeStateCWProxyImpl(this);
}
