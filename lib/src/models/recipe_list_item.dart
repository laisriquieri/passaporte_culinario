import 'package:flutter/material.dart';

class RecipeListItem {
  final int id;
  final String title;
  final int timeToCook;
  final int cost;
  final String flag; // URL da bandeira
  final String foodPicture;
  final bool isFavorite;
  IconData? flagIcon; // IconData correspondente à bandeira

  RecipeListItem({
    required this.id,
    required this.title,
    required this.timeToCook,
    required this.cost,
    required this.flag,
    required this.foodPicture,
    required this.isFavorite,
  }) {
    flagIcon = getIconDataFromUrl(flag);
  }

  IconData? getIconDataFromUrl(String url) {
    // Lógica para converter a URL da bandeira em IconData
    if (url.contains('Flag_of_Brazil.svg')) {
      return Icons.flag; // Exemplo de bandeira do Brasil
    }
    // Adicione mais condições para outras bandeiras conforme necessário
    return null; // Retorna null se não encontrar correspondência
  }

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
