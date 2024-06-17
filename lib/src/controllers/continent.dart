import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:passaporte_culinario/src/models/country.dart';
import 'package:passaporte_culinario/src/models/continent.dart';

class ContinentController {
  Future<List<Continent>> fetchContinents() async {
    final response = await http.get(Uri.parse(
        'https://api.mockfly.dev/mocks/a41fab3e-c0b5-415e-9ee9-e28d1895682b/continents'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      List<Continent> continents = [];

      // Acessa a lista de continentes usando a chave 'continents'
      for (var continentData in jsonData['continents']) {
        List<Country> countries = [];

        // Itera sobre a lista de países dentro de cada continente
        for (var countryData in continentData['countries']) {
          Country country = Country.fromJson(countryData);
          countries.add(country);
        }

        // Cria um objeto Continent e adiciona a lista de países a ele
        Continent continent = Continent.fromJson(continentData);
        continent.countries =
            countries; // Assume que há um setter para countries em Continent
        continents.add(continent);
      }
      return continents;
    } else {
      throw Exception('Failed to fetch continents');
    }
  }
}
