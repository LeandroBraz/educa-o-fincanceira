import 'dart:math';

import 'package:flutter/material.dart';

import '../DAO/api.dao.dart';
import '../DAO/localStorage.dart';
import '../model/Usuario.model.dart';
import '../model/dadosCompra.dart';
import 'Home.view.dart';
import 'In.metas.view.dart';
import 'Inventario.view.dart';
import 'Metas.view.dart';

class Simulador extends StatefulWidget {
  @override
  State<Simulador> createState() => _SimuladorState();
}

class _SimuladorState extends State<Simulador> {
  late Usuario user;
  late DadosCompra dadosComprasUsuario;
  late Map<String, dynamic> dadosFiltrados;
  List<dynamic> listaResultado = [];
  List<dynamic> visibleItems = [];
  List<dynamic> invisibleItems = [];

  List<dynamic> regra = [
    {
      'aumenta_chance': 5,
      'chance_venda': 0,
      'nome': 'canal_youtube',
      'descricao': "You tube",
      'tipo': "Canal",
      'preco_venda': 0,
      'image': 'assets/imagens/icon_youtube.png',
      'qtd': 0
    },
    {
      'aumenta_chance': 25,
      'chance_venda': 0,
      'nome': 'canal_facebook',
      'descricao': "Facebook",
      'tipo': "Canal",
      'preco_venda': 0,
      'image': 'assets/imagens/icon_facebook.png',
      'qtd': 0
    },
    {
      'aumenta_chance': 20,
      'chance_venda': 0,
      'nome': 'canal_instagram',
      'descricao': "Instagram",
      'tipo': "Canal",
      'preco_venda': 0,
      'image': 'assets/imagens/icon_instagram.png',
      'qtd': 0
    },
    {
      'aumenta_chance': -15,
      'chance_venda': 0,
      'nome': 'canal_twitter',
      'descricao': "Twitter",
      'tipo': "Canal",
      'preco_venda': 0,
      'image': 'assets/imagens/icon_twitter.png',
      'qtd': 0
    },
    {
      'aumenta_chance': 0,
      'chance_venda': 25,
      'nome': 'produto_duraveis',
      'descricao': "Livros",
      'tipo': "Produto",
      'preco_venda': 120,
      'image': 'assets/imagens/produtos_livros.png',
      'qtd': 0
    },
    {
      'aumenta_chance': 0,
      'chance_venda': 15,
      'nome': 'produto_servicos',
      'descricao': "Eletronicos",
      'tipo': "Produto",
      'preco_venda': 50,
      'image': 'assets/imagens/produtos_eletronicos.png',
      'qtd': 0
    },
    {
      'aumenta_chance': 0,
      'chance_venda': 20,
      'nome': 'produto_especiais',
      'descricao': "Produtos",
      'tipo': "Produto",
      'preco_venda': 150,
      'image': 'assets/imagens/produtos_informatica.png',
      'qtd': 0
    },
    {
      'aumenta_chance': 0,
      'chance_venda': 30,
      'nome': 'produto_emergencia',
      'descricao': "Alimentação",
      'tipo': "Produto",
      'preco_venda': 50,
      'image': 'assets/imagens/produtos_alimentacao.png',
      'qtd': 0
    },
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      user = await buscarDadosUsuario();
      DadosCompra dadosCompra = await getDadosCompra();
      print(dadosCompra);
      if (dadosCompra != null) {
        setState(() {
          dadosComprasUsuario = dadosCompra;
          mapear(); // Faltava chamar mapear() aqui
        });
      }
    } catch (error) {
      print('Erro ao adicionar objeto à lista: $error');
    }
  }

  void mapear() {
    Map<String, dynamic> updatedRegra =
        updateQuantities(regra, dadosComprasUsuario.toMap());
    setState(() {
      listaResultado = reindexList(updatedRegra.values.toList());
      visibleItems = listaResultado
          .where((item) => item['qtd'] > 0 || item['ativo'])
          .toList();
      print(visibleItems);
    });
  }

  Map<String, dynamic> updateQuantities(
      List<dynamic> regra, Map<String, dynamic> inputData) {
    Map<String, dynamic> updatedRegra = {};

    for (var item in regra) {
      String itemName = item['nome'];
      if (inputData.containsKey(itemName)) {
        int qtd = 0;
        bool ativo = false;

        if (itemName.startsWith('canal')) {
          ativo = inputData[itemName];
          qtd = 0;
        } else if (itemName.startsWith('produto')) {
          qtd = inputData[itemName];
          ativo = false;
        }

        updatedRegra[itemName] = {
          ...item,
          'qtd': qtd,
          'ativo': ativo,
        };
      }
    }

    return updatedRegra;
  }

  List<dynamic> reindexList(List<dynamic> originalList) {
    List<dynamic> reindexedList = [];
    for (int i = 0; i < originalList.length; i++) {
      reindexedList.add(originalList[i]);
    }
    return reindexedList;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text('Pronto pra jogo?'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate to the home screen here
              // Replace 'YourHomeScreen()' with the actual widget or route for your home screen
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(
                  Inventario(
                    InMetas(),
                  ),
                  MetasView(),
                  this.user,
                ),
              ));
            },
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.purple[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   padding: EdgeInsets.all(20),
            //   child: Stack(
            //     alignment: Alignment.center,
            //     children: [
            //       Text(
            //         'Pronto para o Jogo?',
            //         style: TextStyle(
            //           fontSize: 24,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black,
            //           shadows: [
            //             Shadow(
            //               color: Colors.white,
            //               offset: Offset(1, 1),
            //               blurRadius: 3,
            //             ),
            //           ],
            //         ),
            //       ),
            //       Positioned(
            //         top: 50,
            //         child: Container(
            //           width: 100,
            //           height: 100,
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: AssetImage('assets/imagens/icon_youtube.png'),
            //               fit: BoxFit.contain,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20), // Espaço entre o título e a listagem
            Expanded(
              flex: 3,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: visibleItems.length,
                itemExtent:
                    60, // Aumentei o valor para melhorar a visibilidade dos itens
                itemBuilder: (context, index) {
                  final item = visibleItems[index];
                  final isProduct = item['tipo'] == 'Produto';

                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    leading: SizedBox(
                      width: 50,
                      child: Image.asset(item['image']),
                    ),
                    title: Text(
                      item['descricao'].toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Tipo: ${item['tipo']}' +
                          (isProduct
                              ? ' | Quantidade: ${item['qtd'].toInt()}'
                              : ' | Comprado'),
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                },
              ),
            ),
            // Expanded(
            //   flex: 3,
            //   child: ListView.builder(
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     itemCount: visibleItems.length,
            //     itemExtent: 60,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         contentPadding: EdgeInsets.symmetric(vertical: 8),
            //         leading: SizedBox(
            //           width: 30,
            //           child: Image.asset(visibleItems[index]['image']),
            //         ),
            //         title: Text(
            //           'Nome  ${visibleItems[index]['descricao'].toString()}',
            //           style: TextStyle(
            //             fontSize: 16,
            //             color: Colors.purple[800],
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         subtitle: Text(
            //           'Tipo: ${visibleItems[index]['tipo'].toString()}' +
            //               (visibleItems[index]['tipo'].toString() == 'Produto'
            //                   ? ' | Quantidade : ${visibleItems[index]['qtd'].toString()}'
            //                   : ' | Comprado'),
            //           style: TextStyle(fontSize: 14),
            //         ),
            //       );
            //     },
            //   ),
            // ),

            Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    List<Map<String, dynamic>> dadosSimulados =
                        simular(visibleItems);
                    atualizarAmbiente(dadosSimulados, context);
                  });

                  // Lógica para lidar com o botão de simulação
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'Iniciar Simulação',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> simular(List<dynamic> data) {
    double AUMENTA_CHANCE = 0;
    List<Map<String, dynamic>> vendas = [];

    // Calculate AUMENTA_CHANCE
    for (var item in data) {
      if (item["nome"].contains("canal_")) {
        print(item["aumenta_chance"]);

        AUMENTA_CHANCE += item["aumenta_chance"];
      }
    }

    // Calculate and print chance for products
    for (var item in data) {
      if (item["nome"].contains("produto_")) {
        int countVendido = 0;
        double totalChance = item["chance_venda"] + AUMENTA_CHANCE;
        double chancePercentage = totalChance / 100.0;

        for (int i = 0; i < item["qtd"]; i++) {
          double randomValue = Random().nextDouble();

          if (randomValue <= chancePercentage) {
            countVendido++;
            // print("Produto: ${item["nome"]} - Não foi sorteado.");
          }
        }
        vendas.add({
          'nome': item["nome"],
          'qtd_vendido': countVendido,
          'qtd_total': item["qtd"],
          'valor_recebido': (item['preco_venda'] * countVendido)
        });
        item["qtd"] = item["qtd"] -
            countVendido; // Subtrai a quantidade vendida da quantidade total
      }
    }
    return vendas;
  }

  void atualizarAmbiente(
      List<Map<String, dynamic>> dados, BuildContext contexto) async {
    try {
      Usuario user = await buscarDadosUsuario();
      if (user == null) {
        return;
      }
      double novoSaldo = 0;
      double quantidadeVendida = 0;
      for (var item in dados) {
        novoSaldo += item['valor_recebido'];
        quantidadeVendida += item['qtd_vendido'];
        await atualizaCompra(
            user.uuid,
            (item['qtd_total'].toInt() - item['qtd_vendido'].toInt()),
            item['nome']);
      }
      await atualizarDadosUsuario((novoSaldo.toInt() + user.saldo!));
      await updateValor(user.uuid, (novoSaldo.toInt() + user.saldo!));
      showSuccessDialog(contexto, quantidadeVendida.toInt(), novoSaldo.toInt());
    } catch (error) {
      print('erro ao Atualizar dados');
    }
  }
}

void showSuccessDialog(
    BuildContext context, int quantidadeVendida, int novoSaldo) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context, quantidadeVendida, novoSaldo),
      );
    },
  );
}

Widget contentBox(BuildContext context, int quantidadeVendida, int novoSaldo) {
  return Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          top: 30,
          bottom: 16,
          left: 16,
          right: 16,
        ),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Success!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Foram Vendidos:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$quantidadeVendida unidades",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              "Valor acrescentado ao saldo:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "R\$ $novoSaldo",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Fechar",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
