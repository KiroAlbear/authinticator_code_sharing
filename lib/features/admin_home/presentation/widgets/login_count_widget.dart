import 'package:flutter/material.dart';

import '../../../../imports.dart';

class LoginCountWidget extends StatelessWidget {
  final int count;

  const LoginCountWidget({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
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
