import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0.2,
              ),
              borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
         ),
        ),
        
      );
  }
}
