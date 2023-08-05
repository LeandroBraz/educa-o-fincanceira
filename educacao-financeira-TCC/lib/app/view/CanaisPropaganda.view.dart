import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../DAO/SCRIPT_IN_METAS_BASE.dart';
import '../model/objetoGenerico.dart';

class CanaisPropag extends StatefulWidget {
  @override
  State<CanaisPropag> createState() => _CanaisPropagState();
}

class _CanaisPropagState extends State<CanaisPropag> {
  final List<String> _listitem = [
    'assets/imagens/icon_instagram.png',
    'assets/imagens/icon_twitter.png',
    'assets/imagens/icon_facebook.png',
    'assets/imagens/icon_youtube.png',
  ];

  bool isCardEnabled = true;

  final List<ObjetoGenerico> _listNomesItens = [
    ObjetoGenerico(nome: 'Instagram', preco: 100, ativo: false),
    ObjetoGenerico(nome: 'Twitter', preco: 200, ativo: false),
    ObjetoGenerico(nome: 'Facebook', preco: 123, ativo: false),
    ObjetoGenerico(nome: 'Twitter', preco: 500, ativo: false),
  ];

  final List<String> _listExpl = [
    'Venda x produtos em x dias',
    'Venda x produtos em x dias',
    'Venda x produtos em x dias',
    'Venda x produtos em x dias',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.purple[50],
        child: GridView.builder(
          padding: EdgeInsets.all(100),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 70,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("Pressionou  ${_listNomesItens[index]}");
              },
              child: Card(
                color: Colors.green[200],
                elevation: 50.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.only(bottom: 5, right: 5),
                          child: GestureDetector(
                            child: Image.asset(
                                'assets/imagens/icon_interrogacao.png'),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Container(
                                        height: 200,
                                        width: 50,
                                        child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    _listExpl[index],
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: TextButton(
                                                        // shape:
                                                        //     RoundedRectangleBorder(
                                                        //         borderRadius:
                                                        //             BorderRadius
                                                        //                 .circular(
                                                        //                     20.0)),
                                                        // color: Colors.green,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "Ok",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15),
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: Image.asset(_listitem[index]),
                          margin: EdgeInsets.only(bottom: 5, top: 1),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(_listNomesItens[index].nome!),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: GestureDetector(
                              child: Image.asset(
                                  'assets/imagens/icon_carrinho_compras.png'),
                              //     margin: EdgeInsets.only(bottom: 20),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Container(
                                          height: 200,
                                          width: 50,
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          "Deseja comprar esse item?",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.0),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      child: TextButton(
                                                          // shape: RoundedRectangleBorder(
                                                          //     borderRadius:
                                                          //         BorderRadius
                                                          //             .circular(
                                                          //                 20.0)),
                                                          // color: Colors.red,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Não",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                          )),
                                                    ),
                                                    Container(
                                                      child: TextButton(
                                                          // shape: RoundedRectangleBorder(
                                                          //     borderRadius:
                                                          //         BorderRadius
                                                          //             .circular(
                                                          //                 20.0)),
                                                          // color: Colors.green,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {
                                                              isCardEnabled =
                                                                  false; // Desabilitar o card aqui
                                                            });
                                                          },
                                                          child: Text(
                                                            "Sim",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                          )),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                            )),
                        Container(
                            child: Text(
                              "RS: ${_listNomesItens[index].preco!.toStringAsFixed(2)}",
                              style: TextStyle(),
                            ),
                            margin: EdgeInsets.only(left: 10))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
