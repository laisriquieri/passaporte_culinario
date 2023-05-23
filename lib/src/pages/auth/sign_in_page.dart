import 'package:flutter/material.dart';
import 'package:passaporte_culinario/src/config/custom_colors.dart';
import 'package:passaporte_culinario/src/config/custom_text_field.dart';
import 'package:passaporte_culinario/src/pages/home.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: 400,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 40,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(45)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomTextField(
                  icon: Icons.email,
                  label: "Email",
                ),
                const CustomTextField(
                  icon: Icons.lock,
                  label: "Senha",
                  isSecret: true,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (c) {
                            return Home();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.deepPurpleAccent.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("ou"),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.deepPurpleAccent.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      side: BorderSide(
                        width: 2,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) {
                          return SignInScreen();
                        },
                      ));
                    },
                    child: const Text(
                      "Criar Conta",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
