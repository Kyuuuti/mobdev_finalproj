// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Meal.dart';

class Details extends StatelessWidget {
  static const String routeName = "details";

  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/c86fa7fd5a93f4402631bde333bb755b.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: Text('Details for ${meal.name}'),
        ),
      )
    );
  }
}
