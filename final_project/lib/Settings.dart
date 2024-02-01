// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:midterm/LogoutButton.dart';
import 'package:midterm/main.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  static const String routeName = "settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/c86fa7fd5a93f4402631bde333bb755b.jpg'),
            fit: BoxFit.cover,
          )
        ),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              LogoutButton(text: "Logout", 
              iconData: Icons.logout, 
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(
                  context, Login.routeName, (route) => false);
              })
            ],
          ),
        ),
      )
    );
  }
}