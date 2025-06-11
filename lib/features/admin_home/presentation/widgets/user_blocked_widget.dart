import 'package:code_grapper/config/font/custom_text_styles.dart';
import 'package:flutter/material.dart';

class UserBlockedWidget extends StatelessWidget {
  const UserBlockedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.withAlpha(20),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "Blocked",
          style: AppTextStyles.regular_12_red(context),
        ),
      ),
    );
  }
}
