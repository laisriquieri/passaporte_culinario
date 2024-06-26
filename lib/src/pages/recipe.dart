import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:passaporte_culinario/src/controllers/recipe.dart';
import 'package:passaporte_culinario/src/models/recipe.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final RecipeController _recipeController = RecipeController();

  int _currentImageIndex = 0;

  List<Widget> buildCostIcons(int count) {
    return List.generate(count, (index) {
      return Icon(Icons.attach_money, color: Color(0xffA23045));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededed),
      body: SafeArea(
        child: FutureBuilder<Recipe>(
            future: _recipeController.getRecipe(widget.id),
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
                Recipe recipe = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 65.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          FavoriteIcon(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 200.0,
                                onPageChanged: (index, reason) {
                                  _currentImageIndex = index;
                                },
                              ),
                              items: recipe.images.map((image) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                      child: Image.network(
                                        image,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  recipe.images.asMap().entries.map((entry) {
                                int index = entry.key;
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentImageIndex == index
                                        ? const Color(0xffA23045)
                                        : Colors.grey,
                                  ),
                                );
                              }).toList(),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        recipe.title,
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Column(
                                              children: [
                                                const Icon(
                                                    Icons.timelapse_outlined,
                                                    color: Color(0xffA23045)),
                                                Text(
                                                  '${recipe.timeToCook} min',
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: buildCostIcons(recipe.cost),
                                        ),
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage:
                                                NetworkImage(recipe.flag),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text(
                                      'Ingredientes:',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          recipe.ingredients.map((ingredient) {
                                        return Text('- $ingredient');
                                      }).toList(),
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Text(
                                      'Modo de Preparo:',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: recipe.steps
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int index = entry.key + 1;
                                        String instruction = entry.value;
                                        return Text('$index. $instruction');
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            }),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class FavoriteIcon extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: const Color(0xffA23045),
      ),
    );
  }
}
