import 'package:flutter/material.dart';

class PagReceita extends StatefulWidget {
  const PagReceita({Key? key}) : super(key: key);

  @override
  _PagReceitaState createState() => _PagReceitaState();
}

class _PagReceitaState extends State<PagReceita> {
  List<String> receitas = [
    'Brigadeiro',
    'Coxinha',
    'Feijoada',
    // Adicione quantas receitas você precisar
  ];

  String? cardSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededed),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Center(
              child: Text(
                'Encontramos ${receitas.length} receitas',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: receitas.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 4,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          cardSelecionado = receitas[index];
                        });
                      },
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30, // Ajuste o tamanho do círculo aqui
                            backgroundImage:
                                AssetImage('assets/bandeira-brasil.png'),
                          ),
                          title: Text(receitas[index]),
                          // Adicione mais detalhes da receita conforme necessário
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffededed),
        shadowColor: Colors.transparent,
        title: Text('Pratos Típicos em ${cardSelecionado ?? ""}'),
      ),
    );
  }
}
