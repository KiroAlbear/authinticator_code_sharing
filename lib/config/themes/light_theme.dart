import 'package:key_bridge/imports.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          brightness: Brightness.light,
          primary: StaticColors.primaryColor,
        ),
    scaffoldBackgroundColor: StaticColors.scaffoldBackground_7F4,
    textTheme: TextTheme(
      titleMedium: TextStyleBlueprint.style(context,
          color: StaticColors.blackTextColor_858,
          fontSize: 18.0,
          fontWeight: FontWeight.w500),
    ),
    drawerTheme: const DrawerThemeData(
        backgroundColor: StaticColors.drawerLightBgColor_5e5),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: StaticColors.primaryColor,
        selectionHandleColor: StaticColors.primaryColor_55f,
        selectionColor: StaticColors.primaryColor_55f.withOpacity(0.4)),
    cardTheme: CustomCardTheme.getCardTheme(context).copyWith(
      color: Colors.white,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all<Color>(StaticColors.appTheme_55B),
    ),
    progressIndicatorTheme: customProgressIndicatorTheme,
    switchTheme: customSwitchLightTheme,
    checkboxTheme: customCheckBoxLightTheme,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[800]!, width: 1),
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 0,
        fontWeight: FontWeight.bold,
        height: 0, // Adjusts line height to reduce spacing
      ),
      errorMaxLines: 2,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey, width: 2),
      ),
    ));
