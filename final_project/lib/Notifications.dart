// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  static const String routeName = "notifications";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/c86fa7fd5a93f4402631bde333bb755b.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: const Center(
          child: Text("Welcome to the Notifications Page"),
        ),
      )
    );
  }
}