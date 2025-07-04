import 'package:flutter/material.dart';

import '../../imports.dart';

// import 'package:key_bridge/config/colors/index.dart';
// import 'package:key_bridge/config/dimensions/index.dart';

class CustomRoundedCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderWidth;
  final EdgeInsets? contentPadding;
  final Color? backgroundColor;
  final Color? borderColor;

  const CustomRoundedCard(
      {super.key,
      required this.child,
      this.height,
      this.width,
      this.backgroundColor,
      this.contentPadding,
      this.borderColor,
      this.borderRadius,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: contentPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            borderRadius ?? AppDimensions.cardBorderRadius),
        color: backgroundColor ?? Colors.white,
        border: Border.all(
          color: borderColor ?? backgroundColor ?? Colors.white,
          width: borderWidth ?? 1,
        ),
      ),
      child: child,
    );
  }
}
