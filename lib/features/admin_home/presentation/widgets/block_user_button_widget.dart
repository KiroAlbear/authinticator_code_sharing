import 'package:flutter/material.dart';

import '../../../../imports.dart';

class BlockUserButtonWidget extends StatelessWidget {
  final void Function()? onPressed;

  const BlockUserButtonWidget({required this.onPressed, super.key});

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
              color: onPressed == null ? Colors.grey : Colors.red[300]!,
              width: 1.0,
            ),
          ),
          backgroundColor:
              onPressed == null ? Colors.grey[200] : Colors.transparent,
        ),
        child: Text(
          LocaleKeys.block.tr(),
          style: TextStyleBlueprint.style(context,
              color: onPressed == null ? Colors.grey : Colors.red[300]!,
              fontSize: 16.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
