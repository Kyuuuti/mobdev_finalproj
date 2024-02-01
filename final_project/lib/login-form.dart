// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextInputType textInputType;
  
  const LoginForm(
    {super.key, required this.labelText, 
    required this.hintText, 
    required this.iconData, 
    required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Icon(
            iconData,
            color: Colors.red,
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(
          color: Colors.black
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}