import 'dart:ui';
import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:app_educacao_financeira/app/model/Produto.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProdutoView extends StatefulWidget {
  final controller = Get.put(Controller());
  final quantidadeController = TextEditingController();
  final precoController = TextEditingController();
  final nomeController = TextEditingController();
  String categoria =  "";
  @override
  _ProdutoViewState createState() => _ProdutoViewState();
}

class _ProdutoViewState extends State<ProdutoView> {
  final _formKey = GlobalKey<FormState>();
  int qtdProdutos = 0;
  bool situacao = false;
  double changeElevation = 20;
  int indice = 0;

  // void criarProduto() {
  //   setState(() {
  //     produto = new Produto(
  //         nome: widget.nomeController.text,
  //         preco: double.parse(widget.precoController.text),
  //         quantidade: int.parse(widget.quantidadeController.text));
  //   });
  // }

  void chandeSelection(int index) {
    setState(() {
      indice = index;
      switch (index) {
        case 0:
          widget.categoria = "Alimentação";
          print(widget.categoria);
          break;
        case 1:
          widget.categoria = "Informática";
          print(widget.categoria);
          break;
        case 2:
          widget.categoria = "Livros";
          print(widget.categoria);
          break;
        case 3:
          widget.categoria = "Eletrônicos";
          print(widget.categoria);
          break;
        case 4:
          widget.categoria = "Outros";
          print(widget.categoria);
          break;
        default:
      }
    });
  }

  _openPopup(context, int index) {
    if (index == 4) {
      Alert(
          context: context,
          title: "Nova Categoria",
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cadastrar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
    }
  }

  void changeQtd(int delta) {
    int valor = int.parse(widget.quantidadeController.text);
    setState(() {
      if (qtdProdutos == 0 && delta == -1) {
        print("negativo");
      } else if (widget.quantidadeController.text.isEmpty) {
        qtdProdutos += delta;
      } else
        qtdProdutos = valor + delta;
    });
  }

  void changeTextQuantidade() {
    setState(() {
      widget.quantidadeController.text = qtdProdutos.toString();
    });
  }

  void changeElevacao(double elevacao) {
    setState(() {
      changeElevation = elevacao;
      situacao = false;
    });
  }

  final List<String> _listitem = [
    'assets/imagens/icon_alimentacao.png',
    'assets/imagens/icon_informatica.png',
    'assets/imagens/icon_livros.png',
    'assets/imagens/icon_fone_ouvidos.png',
    'assets/imagens/icon_outros.png',
  ];

  final List<String> _listNomesCategorias = [
    'Alimentação',
    'Informática',
    'Livros',
    'Eletrônicos',
    'Outros',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[300],
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 100,
                        child: GestureDetector(
                          child: Image.asset("assets/imagens/icon_produto.png"),
                          onTap: () {},
                        ),
                      ),
                      Container(
                        child: TextButton(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20.0)),
                            // color: Colors.green,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.controller.criarProduto();
                              }
                            },
                            child: Text(
                              "Produzir",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 30,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O campo é obrigatório";
                            }
                            return null;
                          },
                          controller: widget.nomeController,
                          decoration: InputDecoration(
                            labelText: "Nome",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 30,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O campo é obrigatório";
                            }
                            return null;
                          },
                          controller: widget.precoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixText: "R\$",
                            labelText: "Preço",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 30,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O campo é obrigatório";
                            }
                            return null;
                          },
                          controller: widget.quantidadeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'[, .]')),
                          ],
                          decoration: InputDecoration(
                            labelText: "Quantidade",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: TextButton(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20.0)),
                            // color: Colors.grey[400],
                            onPressed: () {
                              changeQtd(1);
                              changeTextQuantidade();
                            },
                            child: Text(
                              "+",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: TextButton(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20.0)),
                            // color: Colors.grey[400],
                            onPressed: () {
                              changeQtd(-1);
                              changeTextQuantidade();
                            },
                            child: Text(
                              "-",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Categoria:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          height: 150,
                          child: GridView.builder(
                              itemCount: 5,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    _openPopup(context, index);
                                    chandeSelection(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: index == indice
                                                ? Colors.black
                                                : Colors.transparent,
                                            width: 2),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Card(
                                      elevation: changeElevation,
                                      color: Colors.grey[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 70,
                                                height: 50,
                                                child: Image.asset(
                                                    _listitem[index]),
                                                margin: EdgeInsets.only(
                                                    bottom: 5, top: 1),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Text(
                                                    _listNomesCategorias[
                                                        index]),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
