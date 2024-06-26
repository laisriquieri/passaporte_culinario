import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:passaporte_culinario/src/models/country.dart';

import '../pages/recipe_list.dart';

class ContinenteListWidget extends StatelessWidget {
  final String title;
  final List<Country> cardData;

  const ContinenteListWidget({
    Key? key,
    required this.title,
    required this.cardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffA23045),
            ),
          ),
        ),
        SizedBox(
          // Defina a altura desejada
          child: CarouselSlider.builder(
            itemCount: cardData.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return GestureDetector(
                onTap: () {
                  // Navegar para a nova tela quando o card for clicado
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeListPage(
                            country: cardData.elementAt(index).name)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Padding(padding: const EdgeInsets.only(top: 10)),
                        _buildCircleImage(cardData.elementAt(index).flag),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            cardData.elementAt(index).name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 160,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 12 / 6,
              viewportFraction: 0.4,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
