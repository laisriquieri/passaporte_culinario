import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/pages/recipe_list.dart';
//import 'package:passaporte_culinario/src/pages/splashcreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passaporte Culinário',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: RecipeListPage(),
    );
  }
}
