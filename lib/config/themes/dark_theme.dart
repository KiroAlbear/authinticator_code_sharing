import 'package:code_grapper/imports.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme(BuildContext context) => ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.dark,
          ),
      scaffoldBackgroundColor: StaticColors.blueBlackTextColor_62E,
      textTheme: TextTheme(
        titleMedium: TextStyleBlueprint.style(context,
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
      drawerTheme: const DrawerThemeData(
          backgroundColor: StaticColors.drawerDarkBgColor_f1f),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: StaticColors.primaryColor_55f,
        selectionHandleColor: StaticColors.primaryColor_55f,
        selectionColor: StaticColors.primaryColor_55f.withOpacity(0.4),
      ),
      cardTheme: CustomCardTheme.getCardTheme(context).copyWith(
        color: StaticColors.blackTextColor_858,
      ),
      radioTheme: RadioThemeData(
        fillColor:
            WidgetStateProperty.all<Color>(StaticColors.primaryColor_55f),
      ),
      progressIndicatorTheme: customProgressIndicatorTheme,
      switchTheme: customSwitchLightTheme,
      checkboxTheme: customCheckBoxDarkTheme,
    );
