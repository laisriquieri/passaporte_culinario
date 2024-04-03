import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Receita extends StatefulWidget {
  final String? cardSelecionado;

  Receita(this.cardSelecionado, {Key? key}) : super(key: key);

  @override
  _ReceitaState createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
  int _currentImageIndex = 0;

  final List<String> images = [
    'https://fastly.picsum.photos/id/23/3887/4899.jpg?hmac=2fo1Y0AgEkeL2juaEBqKPbnEKm_5Mp0M2nuaVERE6eE',
    'https://fastly.picsum.photos/id/23/3887/4899.jpg?hmac=2fo1Y0AgEkeL2juaEBqKPbnEKm_5Mp0M2nuaVERE6eE',
    'https://fastly.picsum.photos/id/23/3887/4899.jpg?hmac=2fo1Y0AgEkeL2juaEBqKPbnEKm_5Mp0M2nuaVERE6eE',
  ];

  final List<String> ingredients = [
    '1 xícara de farinha de trigo',
    '1/2 xícara de açúcar',
    '1 colher de chá de fermento em pó',
    '1/2 colher de chá de sal',
    '1 ovo',
    '1/2 xícara de leite',
    '2 colheres de sopa de manteiga derretida',
  ];

  final List<String> instructions = [
    'Em uma tigela, misture a farinha, o açúcar, o fermento e o sal.',
    'Adicione o ovo, o leite e a manteiga derretida à mistura seca.',
    'Mexa até obter uma massa homogênea.',
    'Despeje a massa em uma frigideira antiaderente em fogo médio.',
    'Cozinhe por cerca de 2-3 minutos de cada lado ou até dourar.',
    'Sirva quente e aproveite!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededed),
      body: SafeArea(
        child: Column(
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
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                      items: images.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
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
                      children: images.asMap().entries.map((entry) {
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
                            const Center(
                              child: Text(
                                'Título da Receita',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    const Icon(Icons.timelapse_outlined,
                                        color: Color(0xffA23045)),
                                    Container(
                                      width: 30,
                                      child: const Text(
                                        '30 min',
                                        style: TextStyle(fontSize: 8),
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(Icons.attach_money,
                                    color: Color(0xffA23045)),
                                SvgPicture.asset(
                                  'assets/brasil.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                SvgPicture.asset(
                                  'assets/food-steak.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xffA23045),
                                    BlendMode.srcIn,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: ingredients.map((ingredient) {
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  instructions.asMap().entries.map((entry) {
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
        ),
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
