import 'package:flutter/material.dart';
import 'package:key_bridge/core/widgets/custom_elevated_button.dart';

class CustomOkCancelDialog extends StatelessWidget {
  final Function onOkPressed;

  const CustomOkCancelDialog({required this.onOkPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: const Text('Are you sure you want to proceed?'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        CustomElevatedButton(
          color: Theme.of(context).primaryColor,
          height: 40,
          onPressed: () {
            // Perform the action here
            onOkPressed();
            Navigator.of(context).pop(); // Close the dialog
          },
          text: 'Confirm',
        ),
      ],
    );
  }
}
