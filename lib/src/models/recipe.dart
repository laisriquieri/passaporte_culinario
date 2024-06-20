class Recipe {
  final String title;
  final List<String> images;
  final String description;
  final int timeToCook;
  final int cost;
  final String flag;
  final bool isFavorite;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.title,
    required this.images,
    required this.description,
    required this.timeToCook,
    required this.cost,
    required this.flag,
    required this.isFavorite,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      images: List<String>.from(json['images']),
      description: json['description'],
      timeToCook: json['timeToCook'],
      cost: json['cost'],
      flag: json['flag'],
      isFavorite: json['isFavorite'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'images': images,
      'description': description,
      'timeToCook': timeToCook,
      'cost': cost,
      'flag': flag,
      'isFavorite': isFavorite,
      'ingredients': ingredients,
      'steps': steps,
    };
  }
}
