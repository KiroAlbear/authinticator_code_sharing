import 'package:flutter/material.dart';

import '../../imports.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle bold_20_black_appbarText(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: AppDimensions.getFonTSize20,
        fontWeight: TextStyleBlueprint.boldFontWeight,
        height: 1,
        color: Colors.black)!;
  }

  static TextStyle regular_12_red(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red)!;
  }

  static TextStyle regular_14_white_noSpacing(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white)!;
  }

  static TextStyle regular_14_white(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 14, color: Colors.white)!;
  }

  static TextStyle bold_20_white(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)!;
  }

  static TextStyle bold_14_black(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)!;
  }

  static TextStyle bold_14_blue(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: StaticColors.primaryColor)!;
  }

  static TextStyle regular_16_white(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white)!;
  }

  static TextStyle regular_16_grey(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey)!;
  }

  static TextStyle regular_14_black(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 14, color: Colors.black)!;
  }

  static TextStyle regular_14_blue(BuildContext context) {
    return TextStyleBlueprint.style(context,
        fontSize: 14, color: StaticColors.primaryColor)!;
  }
}
