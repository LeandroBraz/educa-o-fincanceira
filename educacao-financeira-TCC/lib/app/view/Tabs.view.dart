import 'package:app_educacao_financeira/app/view/Despesas.view.dart';
import 'package:app_educacao_financeira/app/view/FluxoCaixa.view.dart';
import 'package:app_educacao_financeira/app/view/Lucro_liquido.view.dart';
import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        width: mywidth,
        height: myheight,
        color: Colors.green,
        child: TabBarView(children: <Widget>[
          LucroLiView(),
          DespesasView(),
          Container(
            height: myheight,
            width: mywidth,
            color: Colors.green,
          ),
          FluxoCaixaView(),
        ]),
      ),
    );
  }
}
