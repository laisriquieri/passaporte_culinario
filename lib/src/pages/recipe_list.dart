import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:passaporte_culinario/src/controllers/recipe_list.dart';
import 'package:passaporte_culinario/src/models/recipe_list_iten.dart';
import 'receita.dart'; // Importando o arquivo receita.dart

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  final RecipeListController _recipeListController = RecipeListController();

  int? cardSelecionado;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() async {
    try {
      List<RecipeListItem> recipes =
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
      backgroundColor: const Color(0xFFededed),
      appBar: AppBar(
        backgroundColor: const Color(0xffededed),
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
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 8),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    cardSelecionado = recipes?[index].id;
                                  });
                                  navigateToNovaPagina();
                                },
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: cardSelecionado == recipes?[index].id
                                        ? Colors.transparent
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color:
                                          cardSelecionado == recipes?[index].id
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
                                      child: Text(recipes?[index].title ?? ""),
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
                                              '${recipes?[index].timeToCook ?? 0} min',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        const Icon(Icons.attach_money,
                                            color: Color(0xffA23045)),
                                        // SvgPicture.asset(
                                        //   'assets/${recipes?[index].flag}',
                                        //   width: 20,
                                        //   height: 20,
                                        // ), // Ícone 2
                                        // SvgPicture.asset(
                                        //   'assets/${recipes?[index].foodPicture}',
                                        //   colorFilter: const ColorFilter.mode(
                                        //     Color(0xffA23045),
                                        //     BlendMode.srcIn,
                                        //   ),
                                        // ), // Ícone 4
                                        Icon(
                                          recipes?[index].isFavorite ?? false
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Color(0xffA23045),
                                        ), // Ícone 5
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
