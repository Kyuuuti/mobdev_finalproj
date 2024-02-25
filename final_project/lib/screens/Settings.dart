// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:midterm/components/LogoutButton.dart';
import 'package:midterm/screens/index.dart';

class Settings extends StatefulWidget {
  static const String routeName = "settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              LogoutButton(
                text: "Logout", 
                iconData: Icons.logout, 
                onPressed: logout
              )
            ],
          ),
        ),
      )
    );
  }

  void logout() {
    FirebaseAuth.instance.signOut().then((value) => {
      GoogleSignIn().signOut().then((value) =>
        {Navigator.pushReplacementNamed(context, Login.routeName)})
    });
  }
}