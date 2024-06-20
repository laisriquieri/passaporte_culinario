import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:passaporte_culinario/src/models/recipe_list_iten.dart';

class RecipeListController {
  Future<List<RecipeListItem>> fetchRecipeList() async {
    final response = await http.get(Uri.parse(
        'https://api.mockfly.dev/mocks/a41fab3e-c0b5-415e-9ee9-e28d1895682b/recipes'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => RecipeListItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch recipe list');
    }
  }
}
