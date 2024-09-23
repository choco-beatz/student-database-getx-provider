import 'package:flutter/material.dart';
import 'package:student_database/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController controller;
  final String label;
  final String validate;
  const CustomTextField({
    super.key,
    required this.type,
    required this.label,
    required this.validate, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: black)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validate;
        }
        return null;
      },
    );
  }
}