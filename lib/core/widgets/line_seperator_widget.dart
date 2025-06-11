import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineSeparatorWidget extends StatelessWidget {
  const LineSeparatorWidget({super.key, this.paddingHeight});
  final double? paddingHeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingHeight ?? 50.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.2),
              height: 0.5,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
