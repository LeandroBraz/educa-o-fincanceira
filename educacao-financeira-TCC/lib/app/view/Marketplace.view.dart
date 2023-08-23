import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/model/dadosCompra.dart';
import 'package:app_educacao_financeira/app/view/Home.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../DAO/api.dao.dart';
import '../model/objetoGenerico.dart';
import '../DAO/localStorage.dart';
import '../provider/produtosProvider.dart';
import 'package:provider/provider.dart';

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
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Container(
                                          height: 300,
                                          width: 300,
                                          child: Padding(
                                            padding: EdgeInsets.all(15.0),
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      15.0,
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return StatefulBuilder(
                                                                      builder:
                                                                          (context,
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
                                                                              padding: EdgeInsets.all(20.0),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Text(
                                                                                    "Quantos produtos deseja comprar?",
                                                                                    style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 15,
                                                                                    ),
                                                                                  ),
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
                                                                                      setState(() => {
                                                                                            validarCompra(nomeDoCanalParaCompra!, _listNomesItens[index].preco!, quantity, context),
                                                                                            Navigator.pop(context)
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
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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

    switch (nomeProduto) {
      case 'Informatíca':
        // Produto A
        custoProdutoUnidade = 100;
        break;
      case 'Livros':
        // Produto B
        custoProdutoUnidade = 80;
        break;
      case 'Eletrodomesticos':
        // Produto C
        custoProdutoUnidade = 60;
        break;
      case 'Alimentação':
        // Produto D
        custoProdutoUnidade = 70;
        break;
      default:
        break;
    }
  }

  int calcularPreco(String nomeProduto, quantidade) {
    int custoProdutoUnidade = 0;

    switch (nomeProduto) {
      case 'Informatíca':
        // Produto A
        quantidade >= 10 ? custoProdutoUnidade = 80 : custoProdutoUnidade = 100;
        return custoProdutoUnidade;
      case 'Livros':
        // Produto B
        quantidade >= 10 ? custoProdutoUnidade = 60 : custoProdutoUnidade = 80;
        return custoProdutoUnidade;
      case 'Eletrodomesticos':
        // Produto C
        quantidade >= 10 ? custoProdutoUnidade = 45 : custoProdutoUnidade = 60;
        return custoProdutoUnidade;
      case 'Alimentação':
        // Produto D
        quantidade >= 10 ? custoProdutoUnidade = 50 : custoProdutoUnidade = 70;
        return custoProdutoUnidade;
      default:
        return custoProdutoUnidade;
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
      print('erro ao add objt na lista de produtos de MarketPalce ');
    }
  }

  void validarCompra(
      String tipoProduto, int preco, int quantity, BuildContext context) async {
    Usuario user = await buscarDadosUsuario();
    int precoPorUnidade = calcularPreco(tipoProduto, quantity);

    int valorASerPago = precoPorUnidade * quantity;
    if (user.saldo! >= valorASerPago) {
      await atualizacaoDosCampos(preco, tipoProduto, quantity);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Aviso"),
            content: Text(
                "Não foi possível comprar essa quantidade de produtos. Saldo insuficiente."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

Future<void> atualizacaoDosCampos(
    int valorSaldo, String nomeCampo, int quantidade) async {
  try {
    Usuario user = await buscarDadosUsuario();
    if (user == null) {
      return;
    }
    print(nomeCampo);

    var novoSaldo = user.saldo! - valorSaldo;
    var campo = converteCampo(nomeCampo);
    await atualizaCompra(
      user.uuid,
      quantidade,
      campo,
    );
    await atualizarDadosUsuario(novoSaldo, fase: 3);
    await updateValor(user.uuid, novoSaldo);
    await updateFase(user.uuid, 3);
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
