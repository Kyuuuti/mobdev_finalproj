// ignore_for_file: file_names

class Meal {
  final String id;
  final String name;

  Meal({required this.id, required this.name});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
    );
  }
}
