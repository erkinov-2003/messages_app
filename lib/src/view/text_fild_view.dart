import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({
    Key? key,
    this.validator,
    required this.hintText,
    this.controller,
    this.counterText,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController? controller;
  final String? counterText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        hintStyle: const TextStyle(color: Color(0xFF5B6262), fontSize: 15),
        fillColor: const Color(0xFFE8ECF4),
        hintText: hintText,
        counterText: counterText,
        counterStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w500,
          fontSize: 14
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
