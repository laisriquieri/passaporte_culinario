import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/pages/home.dart';
import 'package:passaporte_culinario/src/pages/favoritos.dart';
import 'package:passaporte_culinario/src/pages/profile.dart';
import 'package:passaporte_culinario/src/pages/trend_recipe_list.dart';

class BaseScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          const TrendRecipes(),
          const Favoritos(),
          const Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFededed),
        selectedItemColor: const Color(0xffA23045),
        unselectedItemColor: Colors.black45,
        selectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_rounded),
            label: 'Tops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
