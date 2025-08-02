import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  const CustomCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          decoration: BoxDecoration(
            // color: Colors.transparent,
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff312c42),
                Color(0xff252130),
              ],
            ),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: const Color(0xff433e54),
              width: 1,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withAlpha(90),
            //     spreadRadius: 1,
            //     blurRadius: 15,
            //     offset: const Offset(0, 6), // changes position of shadow
            //   ),
            // ],
          ),
          child: child,
        ),
      ),
    );
  }
}
