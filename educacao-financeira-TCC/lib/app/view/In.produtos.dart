import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:flutter/material.dart';

class InProdutos extends StatelessWidget {
  String quantidade;
  String nome;
  String categoria;
  InProdutos({ required this.nome, required this.quantidade, required this.categoria});

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
                        margin: EdgeInsets.only(right: 5),
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/imagens/icon_moedas.png')),
                    Text(
                      "100,00",
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
                  "Nome: $nome",
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
                  "Quantidade: $quantidade",
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
                  "Categoria: $categoria",
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
}
