import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/view/Home.view.dart';
import 'package:app_educacao_financeira/app/view/Metas.view.dart';
import 'package:app_educacao_financeira/app/view/Inventario.view.dart';
import 'package:app_educacao_financeira/app/view/In.metas.view.dart';

import '../data/home_dao.dart';

class InfoPages extends StatefulWidget {
  Usuario user;

  InfoPages(this.user);

  @override
  _InfoPagesState createState() => _InfoPagesState();
}

class _InfoPagesState extends State<InfoPages> {
  int idPage = 0;

  void changePage(int nume) {
    setState(() {
      idPage = nume;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (num) {
                  changePage(num);
                },
                children: [
                  _buildPage(
                    size,
                    Colors.purple[50]!,
                    'assets/imagens/icon_produto.png',
                    'Produto',
                    'Você aprenderá a ser empreendedor administrando a saúde financeira da sua empresa. Como fonte de receita terá que vender produtos. Os produtos podem ter várias características que serão livres para serem definidas por você. Cada característica implica em um desempenho diferente de vendas. Esse desempenho influenciará se as metas do jogo serão atingidas. Provando assim se você se tornou ou não um bom empreendedor.',
                  ),
                  _buildPage(
                    size,
                    Colors.purple[50]!,
                    'assets/imagens/icon_info_propaganda.png',
                    'Canais de Propaganda',
                    'Para que seus produtos alcancem os clientes, será necessário utilizar um canal para que seja feita a propaganda dos produtos. Cada canal terá resultados diferentes em cada tipo de produto criado.',
                  ),
                  _buildPage(
                    size,
                    Colors.purple[50]!,
                    'assets/imagens/icon_empreendedor.png',
                    'Marketplace',
                    'Com o intuito de potencializar as vendas, você poderá utilizar anúncios em Marketplaces diferentes. No qual, terá resultados diferentes em produtos diferentes.',
                  ),
                  _buildPage(
                    size,
                    Colors.purple[50]!,
                    'assets/imagens/icon_info_financas.png',
                    'Finanças',
                    'Você aprenderá a ser empreendedor administrando a saúde financeira da sua empresa. Como fonte de receita terá que vender produtos. Os produtos podem ter várias características que serão livres para serem definidas por você. Cada característica implica em um desempenho diferente de vendas. Esse desempenho influenciará se as metas do jogo serão atingidas. Provando assim se você se tornou ou não um bom empreendedor.',
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green[800],
              height: size.height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: idPage == i
                            ? Colors.purple[300]
                            : Colors.purple[50],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
    Size size,
    Color bgColor,
    String imagePath,
    String title,
    String description,
  ) {
    return Container(
      color: bgColor,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.30,
                height: 150,
                child: GestureDetector(
                  child: Image.asset(imagePath),
                  onTap: () {},
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                color: Colors.green[400],
                width: size.width * 0.50,
                height: size.height * 0.70,
                margin: EdgeInsets.only(top: 15),
                child: Card(
                  color: Colors.white54,
                  elevation: 50.0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(40),
                            child: Text(
                              title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                description,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(
                                  Inventario(
                                    InMetas(),
                                  ),
                                  MetasView(),
                                  widget.user,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Pular",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
