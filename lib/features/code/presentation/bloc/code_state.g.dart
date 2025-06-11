// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CodeStateCWProxy {
  CodeState codeData(CodeResponseModel? codeData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodeState(...).copyWith(id: 12, name: "My name")
  /// ````
  CodeState call({
    CodeResponseModel? codeData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCodeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCodeState.copyWith.fieldName(...)`
class _$CodeStateCWProxyImpl implements _$CodeStateCWProxy {
  const _$CodeStateCWProxyImpl(this._value);

  final CodeState _value;

  @override
  CodeState codeData(CodeResponseModel? codeData) => this(codeData: codeData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodeState(...).copyWith(id: 12, name: "My name")
  /// ````
  CodeState call({
    Object? codeData = const $CopyWithPlaceholder(),
  }) {
    return CodeState(
      codeData: codeData == const $CopyWithPlaceholder()
          ? _value.codeData
          // ignore: cast_nullable_to_non_nullable
          : codeData as CodeResponseModel?,
    );
  }
}

extension $CodeStateCopyWith on CodeState {
  /// Returns a callable class that can be used as follows: `instanceOfCodeState.copyWith(...)` or like so:`instanceOfCodeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CodeStateCWProxy get copyWith => _$CodeStateCWProxyImpl(this);
}
