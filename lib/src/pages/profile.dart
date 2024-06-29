import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 57, bottom: 100, left: 140),
            child: Text(
              'Meu perfil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 430,
            height: 200,
            margin: const EdgeInsets.only(left: 35, right: 35, bottom: 15),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 50),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/bandeira-brasil.png'),
                    radius: 40,
                  ),
                  title: Text('Nome do Usuário'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, bottom: 15),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: const Text('Informações Pessoais'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (c) {
                      return PersonalInfoPage();
                    },
                  ));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, bottom: 15),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: const Text('Alterar Senha'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordPage()),
                  );
                },
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 35, right: 35, bottom: 15),
          //   child: Card(
          //     elevation: 4,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     child: ListTile(
          //       title: const Text('Selecionar País'),
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => SelectCountryPage()),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, bottom: 15),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: const Text('Ajuda'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações Pessoais'),
      ),
      body: const Center(
        child: Text('Página de Informações Pessoais'),
      ),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar Senha'),
      ),
      body: const Center(
        child: Text('Página de Alteração de Senha'),
      ),
    );
  }
}

class SelectCountryPage extends StatelessWidget {
  const SelectCountryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecionar País'),
      ),
      body: const Center(
        child: Text('Página de Seleção de País'),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajuda'),
      ),
      body: const Center(
        child: Text('Página de Ajuda'),
      ),
    );
  }
}
