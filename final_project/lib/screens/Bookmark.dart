import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midterm/functions.dart';
import 'package:midterm/screens/Details.dart';
import 'package:midterm/models/Meal.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  final Functions func = Functions();
  List<Meal> bookmarkedMeals = [];

  @override
  void initState() {
    super.initState();
    fetchBookmarkedMeals();
  }

  Future<void> fetchBookmarkedMeals() async {
    List<String> bookmarkedMealIds = await func.getBookmarks();

    List<Meal> meals = [];
    for (String id in bookmarkedMealIds) {
      Meal? meal = await func.getMealById(id);
      if (meal != null) {
        meals.add(meal);
      }
    }

    setState(() {
      bookmarkedMeals = meals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bookmarkedMeals.length,
        itemBuilder: (context, index) {
          final meal = bookmarkedMeals[index];
          return ListTile(
            title: Text(
              meal.name,
              style: const TextStyle(
                color: Colors.red
               ),
            ),
            leading: const Icon(Icons.dining, color: Colors.blue),
            trailing: IconButton(
              onPressed: () async{
                func.update(
                  FirebaseAuth.instance.currentUser!.email.toString(), meal.name);
                setState(() {
                  func.toggleBookmark(meal);
                  print(meal.isBookmarked);
                });
              },
              icon: meal.isBookmarked
            ? Icon(Icons.bookmark)
            : Icon(Icons.bookmark_outline),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(meal: meal),
                ),
              );
            },
          );
        },
      ),
    );
  }
}