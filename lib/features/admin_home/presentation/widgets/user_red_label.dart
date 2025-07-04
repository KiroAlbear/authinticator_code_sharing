import 'package:flutter/material.dart';
import 'package:key_bridge/config/font/custom_text_styles.dart';

class UserRedLabel extends StatelessWidget {
  final String title;

  const UserRedLabel({required this.title, super.key});

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
          title,
          style: AppTextStyles.regular_12_red(context),
        ),
      ),
    );
  }
}
