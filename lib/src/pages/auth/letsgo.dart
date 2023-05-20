// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/pages/auth/sign_in_page.dart';

class LetsGo extends StatefulWidget {
  const LetsGo({Key? key}) : super(key: key);

  @override
  _LetsGoState createState() => _LetsGoState();
}

class _LetsGoState extends State<LetsGo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF991b32),
      body: SingleChildScrollView(),
    );
  }
}
