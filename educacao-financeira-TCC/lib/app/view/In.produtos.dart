import 'dart:convert';

import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:app_educacao_financeira/app/model/dadosCompra.dart';
import 'package:flutter/material.dart';

import '../DAO/localStorage.dart';
import '../model/Usuario.model.dart';
import '../model/objetoGenerico.dart';
import 'package:http/http.dart' as http;

class InProdutos extends StatefulWidget {
  String? quantidade;
  String? nome;
  String? categoria;
  InProdutos(
      { this.nome, this.quantidade,  this.categoria});

  @override
  State<InProdutos> createState() => _InProdutosState();
}

class _InProdutosState extends State<InProdutos> {
   List<ObjetoGenerico> _listNomesItens = [];


  bool _dadosCarregados = false;

  String? nomeDoProdutoParaCompra;

  List<DadosCompra> dadosCompras = [];

  @override
  void initState() {
    getDadosCompra();
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FutureBuilder<Usuario>(
                        future: buscarDadosUsuario(),
                        builder: (context, futuro) {
                          if (futuro.hasData) {
                            var usuario = futuro.data;
                            print(usuario);
                            return Text(usuario!.saldo.toString());
                          } else if (futuro.hasError) {
                            // Lidar com o erro, por exemplo, exibindo uma mensagem de erro na interface
                            return Text("Erro ao carregar dados do usuário.");
                          } else {
                            // Caso ainda esteja carregando os dados do usuário, pode exibir um indicador de progresso, por exemplo:
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/imagens/icon_estoque.png')),
                    Text(
                      "Estoque",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Nome: ${widget.nome}",
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  "Quantidade: ${widget.quantidade}",
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  "Valor: ",
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Categoria: ${widget.categoria}",
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

void calcularImpactoProduto(String nomeProduto) async {
  Usuario u = await buscarDadosUsuario();
  int custoProduto = 0;

  switch (nomeProduto) {
    case 'Serviços':
      custoProduto = 100;
      break;
    case 'Emergencia':
      custoProduto = 150;
      break;
    case 'Especiais':
      custoProduto = 200;
      break;
    case 'Duraveis':
      custoProduto = 300;
      break;
    default:
      break;
  }

  if (custoProduto > 0 && u.saldo! >= custoProduto) {
    u.saldo = u.saldo! - custoProduto;
    print("Produto $nomeProduto foi comprado por $custoProduto coins. ${u.saldo}");
    // aplicar o impacto do anúncio
  } else {
    print("Saldo insuficiente para comprar o produto $custoProduto.");
  }
}

  //Metodo GET de servico de dadosCompra
Future<DadosCompra> getDadosCompra() async {
  Usuario u = await buscarDadosUsuario();
  print(u.uuid);
  String url =
    "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/dadosCompra/${u.uuid}/";
  
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final dadosCompra = DadosCompra.fromJson(json);
    return dadosCompra;
  } else {
    throw Exception('Failed to load dados compra');
  }
}

  Future<void> loadData() async {
  try {
    DadosCompra dadosCompra = await getDadosCompra();
    if (dadosCompra != null) {
      setState(() {
        _listNomesItens.add(ObjetoGenerico(nome: 'Serviços', preco: 150, ativo: dadosCompra.produtoServicos! > 10  ? false : true));
        _listNomesItens.add(ObjetoGenerico(nome: 'Emergência', preco: 150, ativo: dadosCompra.produtoEmergencia! > 10  ? false : true));
        _listNomesItens.add(ObjetoGenerico(nome: 'Especiais', preco: 150, ativo: dadosCompra.produtoEspeciais! > 10  ? false : true));
        _listNomesItens.add(ObjetoGenerico(nome: 'Duraveis', preco: 150, ativo: dadosCompra.produtoDuraveis! > 10  ? false : true));
        _dadosCarregados = true;
      });
    }
  } catch (error) {
    print('erro ao add objt na lista de canais ');
  }
}
}
