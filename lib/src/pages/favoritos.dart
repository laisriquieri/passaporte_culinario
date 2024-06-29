import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/controllers/recipe_list.dart';
import 'package:passaporte_culinario/src/models/recipe_list_item.dart';
import 'package:passaporte_culinario/src/widgets/error_pictures_widget.dart';
import 'package:passaporte_culinario/src/widgets/recipe_list_item_widget.dart';

int getErrorCodeFromApi() {
  return 404;
}

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  final RecipeListController _recipeListController = RecipeListController();

  @override
  Widget build(BuildContext context) {
    final int errorCode = getErrorCodeFromApi();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Center(child: const Text('Receitas Favoritas')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder<List<RecipeListItem>>(
              future: _recipeListController.fetchRecipeList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: ErrorPicturesWidget(errorCode: errorCode),
                  );
                } else if (snapshot.hasData) {
                  List<RecipeListItem>? recipes = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: recipes?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            RecipeListItem recipe = recipes![index];
                            return RecipeListItemWidget(recipe: recipe);
                          },
                        ),
                      ),
                    ],
                  );
                }
                return Container(); // Caso não tenha dados ainda, retorna um container vazio
              },
            ),
          ),
        ],
      ),
    );
  }
}
