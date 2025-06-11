import 'package:flutter/material.dart';

import '../../imports.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Color? color;
  final void Function()? onPressed;

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height ?? AppDimensions.buttonHeight,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: onPressed == null
                ? Colors.grey
                : color ?? Theme.of(context).primaryColor,
          ),
          child: Text(
            text,
            style: TextStyleBlueprint.style(context,
                color: onPressed == null ? Colors.grey : Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}
