import 'dart:convert';

import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/model/dadosCompra.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../DAO/SCRIPT_IN_METAS_BASE.dart';
import '../DAO/api.dao.dart';
import '../model/objetoGenerico.dart';
import 'package:http/http.dart' as http;
import '../DAO/localStorage.dart';

class MarketplaceView extends StatefulWidget {
  const MarketplaceView({super.key});

  @override
  State<MarketplaceView> createState() => _MarketplaceViewState();
}

class _MarketplaceViewState extends State<MarketplaceView> {
  final List<String> _listitem = [
    'assets/imagens/produtos_informatica.png',
    'assets/imagens/produtos_livros.png',
    'assets/imagens/produtos_eletronicos.png',
    'assets/imagens/produtos_alimentacao.png',
  ];

  bool isCardEnabled = true;

  List<ObjetoGenerico> _listNomesItens = [];

  final List<String> _listExpl = [
    'Chances de vendas: 20% \nPreço por unidade: 100 coins\nNa compra de 10 unidades: 800 coins \nPreço a ser vendido: 150',
    'Chances de vendas: 25% \nPreço por unidade: 80 coins\nNa compra de 10 unidades: 600 coins \nPreço a ser vendido: 100',
    'Chances de vendas: 15% \nPreço por unidade: 60 coins\nNa compra de 10 unidades: 450 coins \nPreço a ser vendido: 40',
    'Chances de vendas: 30% \nPreço por unidade: 70 coins\nNa compra de 10 unidades: 500 coins \nPreço a ser vendido: 50',
  ];
  bool _dadosCarregados = false;
  String? nomeDoCanalParaCompra;
  List<DadosCompra> dadosCompras = [];
  int quantity = 1;

  @override
  void initState() {
    getDadosCompra();
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_dadosCarregados) {
      return Expanded(
        flex: 5,
        child: Container(
          color: Colors.purple[50],
          child: GridView.builder(
            padding: const EdgeInsets.all(100),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 70,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (_listNomesItens[index].ativo!) {
                    print("Pressionou ${_listNomesItens[index]}");
                  }
                },
                child: Card(
                  color: _listNomesItens[index].ativo!
                      ? Colors.grey
                      : Colors.green[
                          200], // Define a cor com base no estado 'ativo'
                  elevation: 50.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                                    return StatefulBuilder(
                                      builder: (context, setState) {
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          child: Text(
                                                            "Deseja comprar esse item?",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Não",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return StatefulBuilder(
                                                                  builder: (context,
                                                                      setState) {
                                                                    return Dialog(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            300,
                                                                        width:
                                                                            400,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(20.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Text(
                                                                                "Quantos produtos deseja comprar?",
                                                                                style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 15,
                                                                                ),
                                                                              ),
                                                                              // Row(
                                                                              //   mainAxisAlignment: MainAxisAlignment.center,
                                                                              //   children: [
                                                                              //     GestureDetector(
                                                                              //       onHorizontalDragUpdate: (details) {
                                                                              //         setState(() {
                                                                              //           if (details.delta.dx > 0) {
                                                                              //             // Swipe right: Increase quantity
                                                                              //             quantity++;
                                                                              //           } else if (details.delta.dx < 0 && quantity > 1) {
                                                                              //             // Swipe left: Decrease quantity (minimum 1)
                                                                              //             quantity--;
                                                                              //           }
                                                                              //         });
                                                                              //       },
                                                                              //       child: Text(
                                                                              //         "$quantity",
                                                                              //         style: TextStyle(
                                                                              //           fontSize: 30,
                                                                              //           fontWeight: FontWeight.bold,
                                                                              //         ),
                                                                              //       ),
                                                                              //     ),
                                                                              //   ],
                                                                              // ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  ElevatedButton(
                                                                                    onPressed: () {
                                                                                      setState(() {
                                                                                        if (quantity > 1) {
                                                                                          quantity--;
                                                                                        }
                                                                                      });
                                                                                    },
                                                                                    child: Text("-"),
                                                                                  ),
                                                                                  Text("$quantity"),
                                                                                  ElevatedButton(
                                                                                    onPressed: () {
                                                                                      setState(() {
                                                                                        quantity++;
                                                                                      });
                                                                                    },
                                                                                    child: Text("+"),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  calcularImpactoProduto(nomeDoCanalParaCompra!);
                                                                                  atualizacaoDosCampos(_listNomesItens[index].preco!, nomeDoCanalParaCompra!);
                                                                                  Navigator.pop(context);
                                                                                  setState(() {
                                                                                    _listNomesItens[index].ativo = true; // Desabilitar o card aqui
                                                                                  });
                                                                                },
                                                                                child: Text("Confirmar Compra"),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                            "Sim",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                        );
                                      },
                                    );
                                  },
                                );
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
                                  //captura o nome do canal ao clicar
                                  nomeDoCanalParaCompra =
                                      _listNomesItens[index].nome;
                                  if (!_listNomesItens[index].ativo!) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          child: Container(
                                            height:
                                                250, // Increased height to fit the new input field
                                            width:
                                                200, // Adjust width as needed
                                            child: Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          child: Text(
                                                            "Deseja comprar esse item?",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Não",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return StatefulBuilder(
                                                                  builder: (context,
                                                                      setState) {
                                                                    return Dialog(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            300,
                                                                        width:
                                                                            400,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(20.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Text(
                                                                                "Quantos produtos deseja comprar?",
                                                                                style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 15,
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  GestureDetector(
                                                                                    onHorizontalDragUpdate: (details) {
                                                                                      setState(() {
                                                                                        if (details.delta.dx > 0) {
                                                                                          // Swipe right: Increase quantity
                                                                                          quantity++;
                                                                                        } else if (details.delta.dx < 0 && quantity > 1) {
                                                                                          // Swipe left: Decrease quantity (minimum 1)
                                                                                          quantity--;
                                                                                        }
                                                                                      });
                                                                                    },
                                                                                    child: Text(
                                                                                      "$quantity",
                                                                                      style: TextStyle(
                                                                                        fontSize: 30,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  calcularImpactoProduto(nomeDoCanalParaCompra!);
                                                                                  atualizacaoDosCampos(_listNomesItens[index].preco!, nomeDoCanalParaCompra!);
                                                                                  Navigator.pop(context);
                                                                                  setState(() {
                                                                                    _listNomesItens[index].ativo = true; // Desabilitar o card aqui
                                                                                  });
                                                                                },
                                                                                child: Text("Confirmar Compra"),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                            "Sim",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                        );
                                      },
                                    );
                                  } else {
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            child: Text(
                                                              "item comprado",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15.0),
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
                                                                "Ok",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15),
                                                              )),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  }
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
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  void calcularImpactoProduto(String nomeProduto) async {
    Usuario u = await buscarDadosUsuario();
    int custoProdutoUnidade = 0;
    int custoProdutoVarejo = 0;

    switch (nomeProduto) {
      case 'Informatíca':
        // Produto A
        custoProdutoUnidade = 100;
        custoProdutoVarejo = 800;
        break;
      case 'Livros':
        // Produto B
        custoProdutoUnidade = 80;
        custoProdutoVarejo = 600;
        break;
      case 'Eletrodomesticos':
        // Produto C
        custoProdutoUnidade = 60;
        custoProdutoVarejo = 450;
        break;
      case 'Alimentação':
        // Produto D
        custoProdutoUnidade = 70;
        custoProdutoVarejo = 500;
        break;
      default:
        break;
    }

    if (custoProdutoUnidade > 0 && u.saldo! >= custoProdutoUnidade) {
      u.saldo = u.saldo! - custoProdutoUnidade;
      print(
          "Anúncio $nomeProduto foi comprado por $custoProdutoUnidade coins. ${u.saldo}");
      // aplicar o impacto do anúncio
    } else {
      print("Saldo insuficiente para comprar o anúncio $nomeProduto.");
    }
  }

  Future<void> loadData() async {
    try {
      DadosCompra dadosCompra = await getDadosCompra();
      if (dadosCompra != null) {
        setState(() {
          _listNomesItens.add(ObjetoGenerico(
              nome: 'Informatíca',
              preco: 100,
              ativo: false,
              qtd: dadosCompra.produto_especiais));
          _listNomesItens.add(ObjetoGenerico(
              nome: 'Livros',
              preco: 80,
              ativo: false,
              qtd: dadosCompra.produto_duraveis));
          _listNomesItens.add(ObjetoGenerico(
              nome: 'Eletrodomesticos',
              preco: 60,
              ativo: false,
              qtd: dadosCompra.produto_servicos));
          _listNomesItens.add(ObjetoGenerico(
              nome: 'Alimentação',
              preco: 70,
              ativo: false,
              qtd: dadosCompra.produto_emergencia));
          _dadosCarregados = true;
        });
      }
    } catch (error) {
      print('erro ao add objt na lista de canais ');
    }
  }
}

Future<void> atualizacaoDosCampos(int valorSaldo, String nomeCampo) async {
  try {
    Usuario user = await buscarDadosUsuario();
    if (user == null) {
      return;
    }
    print(nomeCampo);

    var novoSaldo = user.saldo! - valorSaldo;
    var campo = converteCampo(nomeCampo);
    await atualizaCompra(user.uuid, true, campo);
    await atualizarDadosUsuario(novoSaldo);
    await upadateValor(user.uuid, novoSaldo);
    print('Saldo atualizado com sucesso!');
  } catch (e) {
    print('Ocorreu um erro: $e');
  }
}

converteCampo(String campo) {
  switch (campo) {
    case 'Informatíca':
      return 'produto_especiais';
    case 'Livros':
      return 'produto_duraveis';
    case 'Eletrodomesticos':
      return 'produto_servicos';
    case 'Alimentação':
      return 'produto_emergencia';
    default:
      return '';
  }
}
