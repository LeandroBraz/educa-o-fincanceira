import 'package:flutter/material.dart';

class InFinancas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                // decoration: BoxDecoration(
                //     color: Colors.grey,
                //     border: Border.all(
                //       color: Color.fromARGB(255, 0, 0, 0),
                //       width: 2,
                //     ),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey,
                //       blurRadius: 4.0,
                //       spreadRadius: 2.0)
                // ],
                //     borderRadius: BorderRadius.all(Radius.circular(5.0))),
                // margin: EdgeInsets.only(top: 15, left: 5, right: 5),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 5, top: 10),
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/imagens/icon_moedas.png')),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "100,00",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.zero)),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Lucro Líquido",
                      style: TextStyle(fontSize: 10),
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/imagens/icon_dinheiro.png')),
                  ],
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
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.red[400],
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.zero)),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  "Despesas Variáveis",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
