import 'package:flutter/material.dart';
import 'package:midterm/Details.dart';
import 'package:midterm/Meal.dart';

class Bookmark extends StatefulWidget {
  final List<Meal> bookmarkedMeals;

  const Bookmark({Key? key, required this.bookmarkedMeals}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  void toggleBookmark(Meal meal) {
    setState(() {
      if (widget.bookmarkedMeals.contains(meal)) {
        widget.bookmarkedMeals.remove(meal);
      } else {
        widget.bookmarkedMeals.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.bookmarkedMeals.length,
        itemBuilder: (context, index) {
          final meal = widget.bookmarkedMeals[index];
          return ListTile(
            title: Text(meal.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(meal: meal),
                ),
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () => toggleBookmark(meal),
            ),
          );
        },
      ),
    );
  }
}

