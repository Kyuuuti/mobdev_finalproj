// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midterm/screens/Details.dart';
import 'package:midterm/models/Meal.dart';

class Randomizer extends StatefulWidget {
  const Randomizer({Key? key}) : super(key: key);
  static const String routeName = "randomizer";
  
  @override
  _RandomizerState createState() => _RandomizerState();
}

class _RandomizerState extends State<Randomizer> {
  Meal? randomMeal;

  @override
  void initState() {
    super.initState();
    displayRandomMeal();
    
  }
  Future<void> displayRandomMeal() async {
    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/random.php"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meals = data["meals"];
      if (meals != null && meals.isNotEmpty) {
        setState(() {
          randomMeal = Meal.fromJson(meals[0]);
        });
      } else {
        print("No meal data found");
      }
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.loop ,size: 80),
            Text("You will make:"),
            randomMeal != null
                ? GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(meal: randomMeal!),
                        ),
                      );
                    },
                    child: Text(
                      "${randomMeal!.name}!",
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)
                    ),
                  )
                : Text("What to cook today?"),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: displayRandomMeal,
                  child: Text("Shuffle"),
                ),
          ],
        ),
      )
    );
  }
}