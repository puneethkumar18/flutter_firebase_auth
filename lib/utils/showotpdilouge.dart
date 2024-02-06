import 'package:flutter/material.dart';

void showOtpDialouge({
  required BuildContext context,
  required VoidCallback onPressed,
  required TextEditingController controller,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Enter otp"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text("Done"),
        ),
      ],
    ),
  );
}
