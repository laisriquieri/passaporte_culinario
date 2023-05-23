import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/pages/auth/sign_in_page.dart';
import 'package:passaporte_culinario/src/pages/home.dart';

class LetsGo extends StatefulWidget {
  const LetsGo({Key? key}) : super(key: key);

  @override
  _LetsGoState createState() => _LetsGoState();
}

class _LetsGoState extends State<LetsGo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color(0xD9991b32),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(children: [
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 40,
                  ),
                  children: [
                    TextSpan(
                        text: "Passaporte",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 40,
                  ),
                  children: [
                    TextSpan(
                        text: "Culinário",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    top: -50,
                    left: -100,
                    child: Image.asset(
                      'assets/inclinado.png',
                      width: 550,
                      height: 550,
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 1000,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 380,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFffffff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (c) {
                                      return SignInScreen();
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                "Vamos começar!",
                                style: TextStyle(
                                  color: Color(0xFF991b32),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                side: const BorderSide(
                                  width: 2,
                                  color: Colors.transparent,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) {
                                    return Home();
                                  },
                                ));
                              },
                              child: const Text(
                                "Entrar sem login",
                                style: TextStyle(
                                    color: Color(0xFFffffff),
                                    fontSize: 18,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
