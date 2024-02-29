import 'package:flutter/material.dart';
import 'package:midterm/screens/Dashboard.dart';
import 'package:midterm/screens/Home.dart';
import 'package:midterm/screens/Settings.dart';
import 'package:midterm/screens/index.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => const Login(),
  Home.routeName:(BuildContext context) => const Home(),
  Settings.routeName:(BuildContext context) => const Settings(),
  Dashboard.routeName:(BuildContext context) => const Dashboard(),
};