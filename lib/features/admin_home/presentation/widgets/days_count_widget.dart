import 'package:flutter/material.dart';

import '../../../../imports.dart';

class DaysCountWidget extends StatelessWidget {
  final int count;

  const DaysCountWidget({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            count.toString(),
            style: TextStyleBlueprint.style(context,
                color: Colors.white,
                fontSize: 14.0,
                height: 0.5,
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
