import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:passaporte_culinario/src/pages/auth/letsgo.dart';

void main() {
  runApp(const MaterialApp(home: SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return const LetsGo();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF991b32),
      body: Center(
        child: RiveAnimation.asset(
          'assets/passaporte_culinario.riv',
        ),
      ),
    );
  }
}
