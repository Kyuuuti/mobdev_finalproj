// ignore_for_file: file_names, library_private_types_in_public_api
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midterm/Details.dart';
import 'Meal.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  static const String routeName = "dashboard";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Meal> meals = [];
  List<Meal> bookmarkedMeals = [];
  
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    fetchData();
  } 

  Future<void> fetchData() async {
    final searchKeyword = _searchController.text;
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$searchKeyword'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> mealsData = data['meals'];
      setState(() {
        meals = mealsData.map((meal) => Meal.fromJson(meal)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void toggleBookmark(Meal meal) {
    setState(() {
      if (bookmarkedMeals.contains(meal)) {
        bookmarkedMeals.remove(meal);
      } else {
        bookmarkedMeals.add(meal);
      }
    });
  }

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
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onSubmitted: (value) {
                fetchData();
              },
              decoration: const InputDecoration(
                hintText: 'Search for meals...',
                icon: Icon(Icons.search)
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  final isBookmarked = bookmarkedMeals.contains(meal);
                  return ListTile(
                    title: Text(
                      meal.name,
                      style: const TextStyle(
                        color: Colors.red
                      ),
                    ),
                    leading: const Icon(Icons.dining, color: Colors.green),
                    trailing: IconButton(
                      icon: isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_outline),
                      onPressed: () => toggleBookmark(meal)
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(meal: meal)
                        ),
                      ).then((value) {
                        if (value != null && value is Meal) {
                          toggleBookmark(value);
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
