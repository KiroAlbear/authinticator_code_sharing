import 'package:flutter/material.dart';

import '../../../../imports.dart';

class DaysCountWidget extends StatelessWidget {
  final int count;

  const DaysCountWidget({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue.withAlpha(20),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.blue,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
          child: Text(
            count.toString(),
            style: AppTextStyles.regular_14_black(context)
                .copyWith(color: Colors.blue),
          ),
        ));
  }
}
