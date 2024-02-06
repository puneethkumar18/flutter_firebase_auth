import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        clipBehavior: Clip.hardEdge,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
        ),
        onPressed: onTap,
        child: Text(text,style: 
        const TextStyle(
          color: Colors.black
        ),
        ),
      ),
    );
  }
}
