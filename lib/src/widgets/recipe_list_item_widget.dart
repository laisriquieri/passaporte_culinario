import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/models/recipe_list_item.dart';
import 'package:passaporte_culinario/src/pages/recipe.dart';
import 'package:passaporte_culinario/src/widgets/favorite_icon_widget.dart';

class RecipeListItemWidget extends StatefulWidget {
  const RecipeListItemWidget({super.key, required this.recipe});
  final RecipeListItem recipe;

  @override
  State<RecipeListItemWidget> createState() => _RecipeListItemWidgetState();
}

class _RecipeListItemWidgetState extends State<RecipeListItemWidget> {
  int? cardSelecionado;

  List<Widget> buildCostIcons(int count) {
    return List.generate(count, (index) {
      return const Icon(Icons.attach_money, color: Color(0xffA23045));
    });
  }

  void navigateToRecipeDetailPage(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(id: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            cardSelecionado = widget.recipe.id;
          });
          navigateToRecipeDetailPage(widget.recipe.id);
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            color: cardSelecionado == widget.recipe.id
                ? Colors.transparent
                : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: cardSelecionado == widget.recipe.id
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          child: ListTile(
            titleAlignment: ListTileTitleAlignment.center,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.recipe.foodPicture),
            ),
            title: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(widget.recipe.title),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Icon(Icons.timelapse_outlined,
                        color: Color(0xffA23045)),
                    Text(
                      '${widget.recipe.timeToCook} min',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: buildCostIcons(widget.recipe.cost),
                  ),
                ),
                // Verifica se há um ícone correspondente
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(widget.recipe.flag),
                  ),
                ),
                FavoriteIconWidget(
                  isFavorite: widget.recipe.isFavorite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
