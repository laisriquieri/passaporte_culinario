import 'package:flutter/material.dart';

class LetsGo extends StatefulWidget {
  const LetsGo({Key? key}) : super(key: key);

  @override
  _LetsGoState createState() => _LetsGoState();
}

class _LetsGoState extends State<LetsGo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SingleChildScrollView(),
    );
  }
}
