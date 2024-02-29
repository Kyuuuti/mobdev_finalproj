import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:midterm/screens/index.dart';
import 'package:midterm/routes.dart';

void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: const Login(),
    routes: routes,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.red), // Set AppBar background color
      buttonTheme: const ButtonThemeData(buttonColor: Colors.red), // Set button color
    ),
  ));
}