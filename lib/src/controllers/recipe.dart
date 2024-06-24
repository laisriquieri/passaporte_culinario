import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:passaporte_culinario/src/models/recipe.dart';

class recipeController {
  Future<Recipe> getRecipe(int id) async {
    final response = await http.get(Uri.parse(
        'https://api.mockfly.dev/mocks/a41fab3e-c0b5-415e-9ee9-e28d1895682b/recipes/$id'));
    if (response.statusCode == 200) {
      final Recipe jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to fetch recipe detail');
    }
  }
}
