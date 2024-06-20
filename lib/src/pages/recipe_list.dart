import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/controllers/recipe_list.dart';
import 'package:passaporte_culinario/src/models/recipe_list_item.dart';
import 'receita.dart'; // Importando o arquivo receita.dart

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final RecipeListController _recipeListController = RecipeListController();

  int? cardSelecionado;

  List<Widget> buildCostIcons(int count) {
    return List.generate(count, (index) {
      return Icon(Icons.attach_money, color: Color(0xffA23045));
    });
  }

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() async {
    try {
      await _recipeListController.fetchRecipeList();
      setState(() {
        // Atualize a lista de receitas
      });
    } catch (e) {
      // Handle the error accordingly
      print(e);
    }
  }

  void navigateToNovaPagina() {
    if (cardSelecionado != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Receita(cardSelecionado.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text('Pratos Típicos em ${cardSelecionado ?? ""}'),
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
                  return const Center(
                    child: Text('Erro ao carregar receitas'),
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
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 8),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    cardSelecionado = recipe.id;
                                  });
                                  navigateToNovaPagina();
                                },
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                    color: cardSelecionado == recipe.id
                                        ? Colors.transparent
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: cardSelecionado == recipe.id
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      radius:
                                          30, // Ajuste o tamanho do círculo aqui
                                      backgroundImage: AssetImage(
                                          'assets/bandeira-brasil.png'),
                                    ),
                                    title: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(recipe.title),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            const Icon(Icons.timelapse_outlined,
                                                color: Color(0xffA23045)),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              '${recipe.timeToCook} min',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: buildCostIcons(recipe.cost),
                                        ),
                                        Icon(
                                          recipe.isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Color(0xffA23045),
                                        ),
                                      ],
                                    ),
                                    // Adicione mais detalhes da receita conforme necessário
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
