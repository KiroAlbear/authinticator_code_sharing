import 'package:code_grapper/config/font/custom_text_styles.dart';
import 'package:flutter/material.dart';

class MaximumCodesReachedWidget extends StatelessWidget {
  final Function()? onPressed;

  const MaximumCodesReachedWidget({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange.withAlpha(20),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.orange,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Maximum codes reached",
              style: AppTextStyles.bold_14_black(context)
                  .copyWith(color: Colors.orange),
            ),
            SizedBox(
              width: 60,
              height: 30,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.orange, fontSize: 12),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  overlayColor: Colors.orange,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
