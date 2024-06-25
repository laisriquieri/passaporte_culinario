class Recipe {
  final int id;
  final String title;
  final String description;
  final int timeToCook;
  final int cost;
  final String flag;
  final bool isFavorite;
  final List<String> images;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.timeToCook,
    required this.cost,
    required this.flag,
    required this.isFavorite,
    required this.images,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      timeToCook: json['timeToCook'],
      cost: json['cost'],
      flag: json['flag'],
      isFavorite: json['isFavorite'],
      images:
          List<String>.from(json['images'].map((image) => image['imageUrl'])),
      ingredients: List<String>.from(
          json['ingredients'].map((ingredient) => ingredient['name'])),
      steps: List<String>.from(json['steps'].map((step) => step['name'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'timeToCook': timeToCook,
      'cost': cost,
      'flag': flag,
      'isFavorite': isFavorite,
      'images': images.map((image) => {'imageUrl': image}).toList(),
      'ingredients':
          ingredients.map((ingredient) => {'name': ingredient}).toList(),
      'steps': steps.map((step) => {'name': step}).toList(),
    };
  }
}
