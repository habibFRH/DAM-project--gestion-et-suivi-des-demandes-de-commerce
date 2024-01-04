// textFormField.dart

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String label;
  final String hinttext;
  final TextEditingController mycontroller;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextForm({
    Key? key,
    required this.label,
    required this.hinttext,
    required this.mycontroller,
    required this.keyboardType,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Container(
          height: 10,
        ),
        TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: mycontroller,
          decoration: InputDecoration(
            hintText: "   $hinttext",
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 122, 122, 122),
              ),
            ),
          ),
        ),
        Container(
          height: 10,
        ),
      ],
    );
  }
}
