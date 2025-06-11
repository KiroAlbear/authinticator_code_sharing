import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';

CheckboxThemeData customCheckBoxLightTheme = CheckboxThemeData(
  overlayColor: WidgetStateProperty.all<Color>(StaticColors.appTheme_55B),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(3.0),
  ),
  side: WidgetStateBorderSide.resolveWith(
    (Set<WidgetState> states) => BorderSide(
        width: 1.5,
        color: states.contains(WidgetState.selected)
            ? StaticColors.appTheme_55B
            : Colors.grey[400]!),
  ),
);

CheckboxThemeData customCheckBoxDarkTheme = CheckboxThemeData(
  overlayColor: WidgetStateProperty.all<Color>(StaticColors.appTheme_55B),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(3.0),
  ),
  side: WidgetStateBorderSide.resolveWith(
    (Set<WidgetState> states) => const BorderSide(
      width: 1.0,
      color: StaticColors.appTheme_55B,
    ),
  ),
);
