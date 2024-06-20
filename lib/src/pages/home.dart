import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/controllers/continent.dart';
import 'package:passaporte_culinario/src/models/country.dart';
import 'package:passaporte_culinario/src/models/continent.dart';
import 'package:passaporte_culinario/src/widgets/continente_list_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ContinentController _continentController = ContinentController();
  List<Country> cardData = [];

  @override
  void initState() {
    super.initState();
    _loadContinents();
  }

  void _loadContinents() async {
    List<Continent> continents = await _continentController.fetchContinents();
    setState(() {
      // Atualize a lista de continentes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '     Pesquisar',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    color: const Color(0xffA23045),
                    onPressed: () {
                      // Ação de pesquisa
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Change to MainAxisAlignment.start
              children: [
                IconButton(
                    icon: const Icon(Icons.filter_list),
                    color: const Color(0xffA23045),
                    onPressed: () {
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
                                  const Text(
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
                                    title: const Text('Carnes'),
                                    value: false,
                                    onChanged: (bool? value) {
                                      // Ação ao selecionar/desmarcar "Carnes"
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    checkColor: const Color(0xffA23045),
                                    title: const Text('Vegetariano'),
                                    value: false,
                                    onChanged: (bool? value) {
                                      // Ação ao selecionar/desmarcar "Vegetariano"
                                    },
                                  ),
                                  CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    checkColor: const Color(0xffA23045),
                                    title: const Text('Vegano'),
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
                    }),
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
          Expanded(
            child: FutureBuilder<List<Continent>>(
              future: _continentController.fetchContinents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar os continentes'),
                  );
                } else if (snapshot.hasData) {
                  List<Continent>? continents = snapshot.data;
                  return ListView.builder(
                    itemCount: continents?.length,
                    itemBuilder: (context, index) {
                      Continent continent = continents![index];
                      var cardData = continent.countries;
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: ContinenteListWidget(
                            title: continent.name, cardData: cardData),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('Nenhum continente encontrado'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
