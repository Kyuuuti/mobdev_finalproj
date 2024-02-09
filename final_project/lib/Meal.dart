// ignore_for_file: file_names
class Meal {
  final String id;
  final String name;
  final String category;
  final String area;
  final String imgUrl;
  final String ins;

  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.imgUrl,
    required this.ins});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      imgUrl: json['strMealThumb'],
      ins: json['strInstructions']
    );
  }
}
