import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      backgroundColor: const Color(0xFFededed),
      appBar: AppBar(
        backgroundColor: const Color(0xffededed),
        shadowColor: Colors.transparent,
        title: Text('Pratos Típicos em ${cardSelecionado ?? ""}'),
      ),
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
            child: ListView.separated(
              itemCount: receitas.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8),
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
                          top: 8,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30, // Ajuste o tamanho do círculo aqui
                            backgroundImage:
                                AssetImage('assets/bandeira-brasil.png'),
                          ),
                          title: Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(receitas[index]),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Icon(Icons.timelapse_outlined,
                                      color: const Color(0xffA23045)),
                                  Container(
                                    width: 30,
                                    child: Text(
                                      '30 min',
                                      style: TextStyle(fontSize: 8),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(Icons.attach_money,
                                  color: const Color(0xffA23045)),
                              SvgPicture.asset(
                                'assets/brasil.svg',
                                width: 20,
                                height: 20,
                              ), // Ícone 2
                              SvgPicture.asset(
                                'assets/food-steak.svg',
                                color: const Color(0xffA23045),
                              ), // Ícone 4
                              Icon(Icons.favorite_border,
                                  color: const Color(0xffA23045)), // Ícone 5
                            ],
                          ),
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
    );
  }
}
