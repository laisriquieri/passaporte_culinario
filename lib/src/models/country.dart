class Country {
  final String name;
  final int id;
  final String flag;

  Country({required this.name, required this.id, required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      id: json['id'],
      flag: json['flag'],
    );
  }
}
