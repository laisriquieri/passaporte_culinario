class RecipeListItem {
  final int id;
  final String title;
  final int timeToCook;
  final int cost;
  final String flag;
  final String foodPicture;
  final bool isFavorite;

  RecipeListItem({
    required this.id,
    required this.title,
    required this.timeToCook,
    required this.cost,
    required this.flag,
    required this.foodPicture,
    required this.isFavorite,
  });

  factory RecipeListItem.fromJson(Map<String, dynamic> json) {
    return RecipeListItem(
      id: json['id'],
      title: json['title'],
      timeToCook: json['timeToCook'],
      cost: json['cost'],
      flag: json['flag'],
      foodPicture: json['foodPicture'],
      isFavorite: json['isFavorite'],
    );
  }
}
