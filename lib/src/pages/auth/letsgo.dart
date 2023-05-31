// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/pages/auth/sign_in_page.dart';
import 'package:passaporte_culinario/src/pages/base_screen.dart';

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
        backgroundColor: const Color(0xD9991b32),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: const Text.rich(
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
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 55,
                  left: -75,
                  child: Image.asset(
                    'assets/inclinado.png',
                    width: 550,
                    height: 550,
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0xFF991b32),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, bottom: 50, top: 490),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFffffff),
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
                                  return BaseScreen();
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
          ),
        ]));
  }
}
