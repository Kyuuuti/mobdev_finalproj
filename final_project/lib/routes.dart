import 'package:flutter/material.dart';
import 'package:midterm/Dashboard.dart';
import 'package:midterm/Details.dart';
import 'package:midterm/ForgotPassword.dart';
import 'package:midterm/Home.dart';
import 'package:midterm/Notifications.dart';
import 'package:midterm/Profile.dart';
import 'package:midterm/Registration.dart';
import 'package:midterm/Settings.dart';
import 'package:midterm/main.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => const Login(),
  Home.routeName:(BuildContext context) => const Home(),
  Registration.routeName: (BuildContext context) => const Registration(),
  ForgotPassword.routeName:(BuildContext context) => const ForgotPassword(),
  Settings.routeName:(BuildContext context) => const Settings(),
  Dashboard.routeName:(BuildContext context) => const Dashboard(),
  Notifications.routeName:(BuildContext context) => const Notifications(),
  Profile.routeName:(BuildContext context) => const Profile(),
  Details.routeName:(BuildContext context) => const Details()
};