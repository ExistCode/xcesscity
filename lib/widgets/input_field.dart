import 'package:flutter/material.dart';
import 'package:xcesscity/models/colors.dart';

class inputField extends StatefulWidget {
  String text;
  final TextEditingController controller;

  inputField({required this.text, required this.controller});

  @override
  State<inputField> createState() => _inputFieldState();
}

class _inputFieldState extends State<inputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text,
            style: TextStyle(
                fontSize: 17, color: white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          cursorColor: accentOrange,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: white,
            hintText: "Enter ${widget.text} ...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 10),
            ),
          ),
        ),
      ],
    );
  }
}
