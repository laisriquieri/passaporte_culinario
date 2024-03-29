import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(153, 27, 50, .1),
  100: const Color.fromRGBO(153, 27, 50, .2),
  200: const Color.fromRGBO(153, 27, 50, .3),
  300: const Color.fromRGBO(153, 27, 50, .4),
  400: const Color.fromRGBO(153, 27, 50, .5),
  500: const Color.fromRGBO(153, 27, 50, .6),
  600: const Color.fromRGBO(153, 27, 50, .7),
  700: const Color.fromRGBO(153, 27, 50, .8),
  800: const Color.fromRGBO(153, 27, 50, .9),
  900: const Color.fromRGBO(153, 27, 50, 1),
};

abstract class CustomColors {
  static Color customContrastColor = Colors.white;

  static MaterialColor customSwatchColor =
      MaterialColor(0xFFededed, _swatchOpacity);
}
