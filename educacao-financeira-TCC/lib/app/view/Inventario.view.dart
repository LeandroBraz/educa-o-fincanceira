import 'package:app_educacao_financeira/app/view/In.metas.view.dart';
import 'package:flutter/material.dart';

class Inventario extends StatelessWidget {
  Widget inventarioCorrente;

  Inventario(this.inventarioCorrente);

  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.purple[100],
                border: Border(
                    top: BorderSide.none,
                    right: BorderSide(color: Colors.green))),
            child: inventarioCorrente),
      ),
    );
  }
}
