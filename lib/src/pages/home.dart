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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Explore Continentes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    // Adicione a lógica do filtro aqui
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Continent>>(
              future: _continentController.fetchContinents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro ao carregar os continentes'),
                  );
                } else if (snapshot.hasData) {
                  List<Continent>? continents = snapshot.data;
                  return ListView.builder(
                    itemCount: continents?.length,
                    itemBuilder: (context, index) {
                      Continent continent = continents![index];
                      var cardData = continent
                          .countries; // Certifique-se de declarar cardData corretamente
                      return ContinenteListWidget(
                          title: continent.name, cardData: cardData);
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
