import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:passaporte_culinario/src/controllers/recipe.dart';
import 'package:passaporte_culinario/src/models/recipe.dart';
import 'package:passaporte_culinario/src/widgets/error_pictures_widget.dart';
import 'package:passaporte_culinario/src/widgets/favorite_icon_widget.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key, required this.id});
  final int id;

  @override
  // ignore: library_private_types_in_public_api
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final RecipeController _recipeController = RecipeController();

  List<Widget> buildCostIcons(int count) {
    return List.generate(count, (index) {
      return const Icon(Icons.attach_money, color: Color(0xffA23045));
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
                  child: ErrorPicturesWidget(errorCode: 404),
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
                          FavoriteIconWidget(
                            isFavorite: recipe.isFavorite,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CarouselWidget(recipe: recipe),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                    Text(
                                      recipe.description,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
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

class CarouselWidget extends StatefulWidget {
  final Recipe recipe;
  const CarouselWidget({super.key, required this.recipe});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: widget.recipe.images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
          children: widget.recipe.images.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImageIndex == index
                    ? const Color(0xffA23045)
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
