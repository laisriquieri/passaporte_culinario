import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/controllers/recipe_list.dart';
import 'package:passaporte_culinario/src/models/recipe_list_item.dart';
import 'package:passaporte_culinario/src/widgets/recipe_list_item_widget.dart';
import 'recipe.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key, required this.country});
  final String country;

  @override
  // ignore: library_private_types_in_public_api
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final RecipeListController _recipeListController = RecipeListController();

  int? cardSelecionado;

  List<Widget> buildCostIcons(int count) {
    return List.generate(count, (index) {
      return const Icon(Icons.attach_money, color: Color(0xffA23045));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void navigateToNovaPagina(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(id: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text('Pratos Típicos em ${widget.country}'),
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
                    child: Text('Erro ao carregar receitas: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  List<RecipeListItem>? recipes = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Center(
                          child: Text(
                            'Encontramos ${recipes?.length ?? 0} receitas',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
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
