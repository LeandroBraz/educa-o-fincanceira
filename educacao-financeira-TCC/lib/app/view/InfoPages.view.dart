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
                Container(
                  color: Colors.purple[50],
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.30,
                                  height: 100,
                                  child: GestureDetector(
                                    child: Image.asset(
                                        'assets/imagens/icon_produto.png'),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(40),
                                                child: Text("Produto",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                margin: EdgeInsets.all(10),
                                                child: Text(
                                                  " Você aprenderá a ser empreendedor administrando a saúde financeira da sua empresa. Como fonte de receita terá que vender produtos. Os produtos podem ter várias características que serão livres para serem definidas por você. Cada característica implica em um desempenho diferente de vendas. Esse desempenho influenciará se as metas do jogo serão atingidas. Provando assim se você se tornou ou não um bom empreendedor.",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                          margin: EdgeInsets.all(5),
                                          child: TextButton(
                                              // shape: RoundedRectangleBorder(
                                              //     borderRadius:
                                              //         BorderRadius.circular(
                                              //             20.0)),
                                              // color: Colors.grey[400],
                                              onPressed: () {
                                                print(widget.user.nome);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(
                                                              Inventario(
                                                                InMetas(),
                                                              ),
                                                              MetasView(),
                                                              widget.user,
                                                            )));
                                              },
                                              child: Text(
                                                "Pular",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.purple[50],
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.30,
                                  height: 150,
                                  child: GestureDetector(
                                    child: Image.asset(
                                        'assets/imagens/icon_info_propaganda.png'),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(40),
                                              child: Text(
                                                  "Canais de Propaganda",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.all(10),
                                              child: Text(
                                                " Para que seus produtos alcancem os clientes, será necessário utilizar um canal para que seja feita a propaganda dos produtos. Cada canal terá resultados diferentes em cada tipo de produto criado.",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ))
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
                                          margin: EdgeInsets.all(5),
                                          child: TextButton(
                                              // shape: RoundedRectangleBorder(
                                              //     borderRadius:
                                              //         BorderRadius.circular(
                                              //             20.0)),
                                              // color: Colors.grey[400],
                                              onPressed: () {
                                                print(widget.user.nome);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(
                                                              Inventario(
                                                                InMetas(),
                                                              ),
                                                              MetasView(),
                                                              widget.user,
                                                            )));
                                              },
                                              child: Text(
                                                "Pular",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.purple[50],
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.30,
                                  height: 200,
                                  child: GestureDetector(
                                    child: Image.asset(
                                        'assets/imagens/icon_empreendedor.png'),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(40),
                                              child: Text("Marketplace",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.all(10),
                                              child: Text(
                                                " Com o intuito de potencializar as vendas, você poderá utilizar anúncios em Marketplaces diferentes. No qual, terá resultados diferentes em produtos diferentes.",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ))
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
                                              // shape: RoundedRectangleBorder(
                                              //     borderRadius:
                                              //         BorderRadius.circular(
                                              //             20.0)),
                                              // color: Colors.grey[400],
                                              onPressed: () {
                                                print(widget.user.nome);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(
                                                              Inventario(
                                                                InMetas(),
                                                              ),
                                                              MetasView(),
                                                              widget.user,
                                                            )));
                                              },
                                              child: Text(
                                                "Pular",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.purple[50],
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.30,
                                  height: 150,
                                  child: GestureDetector(
                                    child: Image.asset(
                                        'assets/imagens/icon_info_financas.png'),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(40),
                                              child: Text("Finanças",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.all(10),
                                              child: Text(
                                                "Você aprenderá a ser empreendedor administrando a saúde financeira da sua empresa. Como fonte de receita terá que vender produtos. Os produtos podem ter várias características que serão livres para serem definidas por você. Cada característica implica em um desempenho diferente de vendas. Esse desempenho influenciará se as metas do jogo serão atingidas. Provando assim se você se tornou ou não um bom empreendedor.",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ))
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          child: TextButton(
                                              // shape: RoundedRectangleBorder(
                                              //     borderRadius:
                                              //         BorderRadius.circular(
                                              //             20.0)),
                                              // color: Colors.grey[400],
                                              onPressed: () {
                                                print(widget.user.nome);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Home(
                                                              Inventario(
                                                                InMetas(),
                                                              ),
                                                              MetasView(),
                                                              widget.user,
                                                            )));
                                              },
                                              child: Text(
                                                "Iniciar",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:
                          idPage == 0 ? Colors.purple[300] : Colors.purple[50]),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:
                          idPage == 1 ? Colors.purple[300] : Colors.purple[50]),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:
                          idPage == 2 ? Colors.purple[300] : Colors.purple[50]),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:
                          idPage == 3 ? Colors.purple[300] : Colors.purple[50]),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
