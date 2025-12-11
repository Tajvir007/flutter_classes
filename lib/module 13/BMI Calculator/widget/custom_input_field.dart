import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String labelText;
  final TextEditingController controller;
  final TextInputType textInputType;

  const InputField({
    super.key,

    required this.labelText,
    required this.controller,
    required this.textInputType,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // Dynamic

      keyboardType: textInputType, // Dynamic

      decoration: InputDecoration(
        hintText: labelText, // Dynamic
        hintStyle: TextStyle(
            color: Colors.grey
        ),

        label: Text(labelText), // Dynamic
        labelStyle: TextStyle(
          color: Colors.deepOrangeAccent
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.green,
            width: 2,
          ),
        ),
      ),
    );
  }
}