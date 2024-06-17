import 'package:passaporte_culinario/src/models/country.dart';

class Continent {
  final String name;
  final int id;
  List<Country> countries = [];

  Continent(
      {required this.name, required this.id, required List<Country> countries});

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      name: json['name'],
      id: json['id'],
      countries:
          List<Country>.from(json['countries'].map((x) => Country.fromJson(x))),
    );
  }
}
