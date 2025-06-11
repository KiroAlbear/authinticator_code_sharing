import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';

class CustomCardTheme {
  static CardTheme getCardTheme(BuildContext context) {
    return CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
        side: BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
    );
  }
}
