import 'package:flutter/material.dart';
import 'package:key_bridge/config/dimensions/app_dimensions.dart';
import 'package:key_bridge/imports.dart';

extension EmptyPadding on num {
  SizedBox get flexPaddingHeight => SizedBox(
        height: AppDimensions.h(toDouble()),
      );

  SizedBox get flexPaddingWidth => SizedBox(
        width: AppDimensions.w(toDouble()),
      );

  SizedBox get paddingHeight => SizedBox(
        height: toDouble(),
      );

  SizedBox get paddingWidth => SizedBox(
        width: toDouble(),
      );
}
