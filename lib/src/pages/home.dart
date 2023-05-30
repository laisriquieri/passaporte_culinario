import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  final List<String> cardData = [
    'Card 1',
    'Card 2',
    'Card 3',
    'Card 4',
    'Card 5',
    'Card 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededed),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 56, right: 56, left: 56, bottom: 30),
              color: Colors.transparent,
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/funil.svg',
                      color: const Color(0xffA23045),
                    ),
                    onPressed: () {
                      // Abre a tela modal ao clicar no ícone do funil
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 15, right: 15, bottom: 20),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Opções de Filtro',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    checkColor: const Color(0xffA23045),
                                    title: Text('Carnes'),
                                    value: false,
                                    onChanged: (bool? value) {
                                      // Ação ao selecionar/desmarcar "Carnes"
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    checkColor: const Color(0xffA23045),
                                    title: Text('Vegetariano'),
                                    value: false,
                                    onChanged: (bool? value) {
                                      // Ação ao selecionar/desmarcar "Vegetariano"
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    checkColor: const Color(0xffA23045),
                                    title: Text('Vegano'),
                                    value: false,
                                    onChanged: (bool? value) {
                                      // Ação ao selecionar/desmarcar "Vegetariano"
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            color: const Color(0xffA23045),
                            onPressed: () {
                              // Ação de pesquisa
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Text(
                'Viaje pelo mundo através da gastronomia',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Column(
              children: [
                const ListTile(
                  title: Text(
                    'África',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA23045),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200, // Defina a altura desejada
                  child: CarouselSlider.builder(
                    itemCount: cardData.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, left: 15),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 150,
                            child: Center(
                              child: Text(cardData[index]),
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'América',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA23045),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200, // Defina a altura desejada
                  child: CarouselSlider.builder(
                    itemCount: cardData.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, left: 15),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 150,
                            child: Center(
                              child: Text(cardData[index]),
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Antártica',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA23045),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200, // Defina a altura desejada
                  child: CarouselSlider.builder(
                    itemCount: cardData.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, left: 15),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 150,
                            child: Center(
                              child: Text(cardData[index]),
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Ásia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA23045),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200, // Defina a altura desejada
                  child: CarouselSlider.builder(
                    itemCount: cardData.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, left: 15),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 150,
                            child: Center(
                              child: Text(cardData[index]),
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Europa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA23045),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200, // Defina a altura desejada
                  child: CarouselSlider.builder(
                    itemCount: cardData.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, left: 15),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 150,
                            child: Center(
                              child: Text(cardData[index]),
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Oceania',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffA23045),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200, // Defina a altura desejada
                  child: CarouselSlider.builder(
                    itemCount: cardData.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, left: 15),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 150,
                            child: Center(
                              child: Text(cardData[index]),
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
