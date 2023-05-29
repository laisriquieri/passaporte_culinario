// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PagReceita extends StatefulWidget {
  const PagReceita({Key? key}) : super(key: key);

  @override
  _PagReceitaState createState() => _PagReceitaState();
}

class _PagReceitaState extends State<PagReceita> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SingleChildScrollView(),
    );
  }
}
