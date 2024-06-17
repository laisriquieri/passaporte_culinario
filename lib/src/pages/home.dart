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
      appBar: AppBar(
        title: Text('Lista de Continentes'),
      ),
      body: FutureBuilder<List<Continent>>(
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
                cardData = continent.countries;
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
    );
  }
}
