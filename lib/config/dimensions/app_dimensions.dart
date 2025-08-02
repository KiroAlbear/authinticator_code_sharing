import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static ScreenUtil screenUtil = ScreenUtil();
  static Size designSize = const Size(430, 932);
  static double? width;
  static double? height;
  static double textHeight = 1.8;
  static double tabletMinimumWidth = 700;
  static double cardMaxWidth = 400;
  static double mobileScreenWidth = 600;

  static double get screenPadding => w(16.0);

  static double get buttonHeight => 50;
  static double cardBorderRadius = 5;

  static double get getFonTSize14 {
    return 14;
  }

  static double get getFonTSize16 {
    return 16;
  }

  static double get getHelperFonTSize {
    return 16;
  }

  static double get getFonTSize18 {
    return 18;
  }

  static double get getFonTSize20 {
    return 20;
  }

  static double h(double value) {
    return (value / designSize.height) * screenUtil.screenHeight;
  }

  static double w(double value) {
    return (value / designSize.width) * screenUtil.screenWidth;
  }

  static double fullHeight() {
    return screenUtil.screenHeight;
  }

  static double fullWidth() {
    return screenUtil.screenWidth;
  }

  static double deviceHeight(double mobileHeight, double tabletHeight) {
    return fullWidth() > tabletMinimumWidth ? tabletHeight : mobileHeight;
  }

  double? availableScreenHeight(BuildContext context) {
    final Size media = MediaQuery.sizeOf(context);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return (height ?? media.height) -
        (AppBar().preferredSize.height + padding.top);
  }
}
