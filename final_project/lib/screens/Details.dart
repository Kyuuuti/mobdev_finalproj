// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/Meal.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  static const String routeName = "details";

  final Meal meal;
  const Details({required this.meal, Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Map<String, dynamic>? mealDetails;
  @override
  void initState() {
    super.initState();
    getDetails();
  }

  Future<void> getDetails() async {
    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      setState(() {
        mealDetails = data;
      });

    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = widget.meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: Center(
        child: SingleChildScrollView(
        child: mealDetails != null
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                Image.network(
                meal.imgUrl,
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
                Text('${meal.name}'),
                Text('${meal.category}'),
                Text('${meal.area}'),
                Text('${meal.ins}'),
              ]
            )
          ): CircularProgressIndicator()
        )
      )
    );
  }
}