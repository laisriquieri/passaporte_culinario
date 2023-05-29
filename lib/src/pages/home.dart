import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              padding: const EdgeInsets.all(56),
              color: Colors.transparent,
              child: Row(
                children: [
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
            Column(
              children: [
                const ListTile(
                  title: Text('Carrossel 1'),
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
                  title: Text('Carrossel 2'),
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
                  title: Text('Carrossel 3'),
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
                  title: Text('Carrossel 4'),
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
