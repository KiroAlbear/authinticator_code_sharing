import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';

// ElevatedButtonThemeData customElevatedButtonTheme = ElevatedButtonThemeData(
//   style: ButtonStyle(
//     elevation: WidgetStateProperty.all(.1),
//     backgroundColor: WidgetStateProperty.all<Color>(StaticColors.primaryColor),
//     foregroundColor: WidgetStateProperty.all<Color>(
//       Colors.white,
//     ),
//     textStyle: WidgetStateProperty.all<TextStyle>(elevatedButtonTextStyle),
//     overlayColor:
//         WidgetStateProperty.all<Color>(StaticColors.buttonRippleColor_5e5),
//     iconSize: WidgetStateProperty.all(12),
//     iconColor: WidgetStateProperty.resolveWith<Color?>(
//       (Set<WidgetState> states) {
//         if (states.contains(WidgetState.pressed)) {
//           return Colors.white; //<-- SEE HERE
//         }
//         return Colors.white; // Defer to the widget's default.
//       },
//     ),
//
//     shape: elevatedButtonShape,
//   ),
// );

TextStyle elevatedButtonTextStyle = TextStyle(
  fontSize: AppDimensions.getFonTSize20,
  fontWeight: FontWeight.w700,
  fontFamily: 'Almarai',
);

WidgetStateProperty<OutlinedBorder> elevatedButtonShape =
    WidgetStateProperty.all<RoundedRectangleBorder>(
  const RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
    side: BorderSide(color: Colors.transparent),
  ),
);
