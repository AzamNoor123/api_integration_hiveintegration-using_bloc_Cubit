import 'package:flutter/material.dart';

import 'helper/Dimension.dart';

class customTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final String hint;

  customTextField(
      {super.key,
      required this.name,
      required this.hint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter Data in Field';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: name,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimenResource.D_10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimenResource.D_10),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimenResource.D_10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
