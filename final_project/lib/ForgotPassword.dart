// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  static const String routeName = "forgotpwd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/c86fa7fd5a93f4402631bde333bb755b.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: const Center(
          child: Text("Welcome to The Forgot Password Page"),
        ),
      )
    );
  }
}