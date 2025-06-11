import 'package:code_grapper/config/font/custom_text_styles.dart';
import 'package:flutter/material.dart';

class UserNewWidget extends StatelessWidget {
  const UserNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withAlpha(20),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "New",
          style: AppTextStyles.regular_12_red(context)
              .copyWith(color: Colors.green),
        ),
      ),
    );
  }
}
