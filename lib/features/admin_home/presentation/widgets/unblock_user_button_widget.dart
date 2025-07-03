import 'package:flutter/material.dart';

import '../../../../imports.dart';

class UnblockUserButtonWidget extends StatelessWidget {
  final void Function()? onPressed;

  const UnblockUserButtonWidget({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: onPressed == null ? Colors.grey : Colors.green[400]!,
              width: 1.0,
            ),
          ),
          backgroundColor: onPressed == null ? Colors.grey[200] : Colors.white,
        ),
        child: Text(
          LocaleKeys.unblock.tr(),
          style: TextStyleBlueprint.style(context,
              color: onPressed == null ? Colors.grey : Colors.green,
              fontSize: 16.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
