import 'package:flutter/material.dart';

import '../../../../imports.dart';

class LoginCountWidget extends StatelessWidget {
  final int count;

  const LoginCountWidget({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: StaticColors.primaryColor.withAlpha(20),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.purple,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
          child: Text(
            count.toString(),
            style: AppTextStyles.regular_14_black(context)
                .copyWith(color: Colors.purple),
          ),
        ));
  }
}
