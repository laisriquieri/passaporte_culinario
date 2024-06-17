import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'receita.dart'; // Importando o arquivo receita.dart

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

  void navigateToNovaPagina() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Receita(cardSelecionado)), // Usando a classe NovaPagina importada
    );
  }

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
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Center(
              child: Text(
                'Encontramos ${receitas.length} receitas',
                style: const TextStyle(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        cardSelecionado = receitas[index];
                      });
                      navigateToNovaPagina();
                    },
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                        color: cardSelecionado == receitas[index]
                            ? Colors.transparent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: cardSelecionado == receitas[index]
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30, // Ajuste o tamanho do círculo aqui
                          backgroundImage:
                              AssetImage('assets/bandeira-brasil.png'),
                        ),
                        title: Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(receitas[index]),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Icon(Icons.timelapse_outlined,
                                    color: Color(0xffA23045)),
                                SizedBox(
                                  width: 30,
                                  child: Text(
                                    '30 min',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.attach_money,
                                color: Color(0xffA23045)),
                            SvgPicture.asset(
                              'assets/brasil.svg',
                              width: 20,
                              height: 20,
                            ), // Ícone 2
                            SvgPicture.asset(
                              'assets/food-steak.svg',
                              colorFilter: const ColorFilter.mode(
                                Color(0xffA23045),
                                BlendMode.srcIn,
                              ),
                            ), // Ícone 4
                            const Icon(Icons.favorite_border,
                                color: Color(0xffA23045)), // Ícone 5
                          ],
                        ),
                        // Adicione mais detalhes da receita conforme necessário
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
