import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:midterm/models/Meal.dart';

class Functions {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Map<String, bool> bookmarks = {};
  
  Future<List<String>> getBookmarks() async {
    List<String> bookmarkedMealIds = [];

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("bookmarkedMeals")
          .get();

      bookmarkedMealIds = querySnapshot.docs.map((doc) {
        return doc.id;
      }).toList();
    } catch (e) {
      print("Error fetching bookmarks: $e");
    }

    return bookmarkedMealIds;
  }

  Future<Meal?> getMealById(String id) async {
    try {
      DocumentSnapshot mealDoc = await firestore
          .collection("meals")
          .doc(id)
          .get();

      if (mealDoc.exists) {
        return Meal.fromJson(mealDoc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Error fetching meal details: $e");
    }

    return null;
  }

  Future<void> update(String email, String item) async {
    Map<String, bool> bookmark = {};

    await firestore
        .collection("users")
        .where("email", isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        bookmark = Map.from(element["bookmarks"]);
        print(bookmark);
      }
    });

    for (var element in bookmark.keys) {
      if (element == item) {
        bookmark[item] = bookmark[item]! ? false : true;
      }
    }

    await firestore
        .collection("users")
        .where("email", isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        element.reference.update({"bookmarks": bookmark});
      }
    });
    await getBookmarks();
  }
  
  void toggleBookmark(Meal meal) {
    meal.isBookmarked = !meal.isBookmarked;
    //adding/removing from firestore
    if (meal.isBookmarked) {
      addBookmark(meal);
    } else {
      removeBookmark(meal);
    }
  }

  Future<void> addBookmark(Meal meal) async {
    try {
      DocumentSnapshot userDoc = await firestore
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();

      if (!userDoc.exists) {
        print("Meal Document created");
        await firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid).
        set({
          "userID": FirebaseAuth.instance.currentUser?.uid,
          "email": FirebaseAuth.instance.currentUser?.email
        });
      }
      
      await firestore
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("bookmarkedMeals")
      .doc(meal.id).set({
        "mealID": meal.id,
        "name": meal.name,
        "status": meal.isBookmarked
      });
      print("Meal added to bookmark");
    } catch (e) {
      print("Error adding bookmark: $e");
    }
  }

  Future<void> removeBookmark(Meal meal) async {
    try {
      await firestore
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("bookmarkedMeals")
      .doc(meal.id)
      .delete();
      print("Meal removed from bookmark");
    } catch (e) {
      print("Error removing bookmark: $e");
    }
  }

}