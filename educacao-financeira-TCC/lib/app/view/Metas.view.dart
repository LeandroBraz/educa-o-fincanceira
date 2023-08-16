import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/view/CanaisPropaganda.view.dart';
import 'package:app_educacao_financeira/app/view/In.marketplace.dart';
import 'package:app_educacao_financeira/app/view/In.propagandas.dart';
import 'package:app_educacao_financeira/app/view/Marketplace.view.dart';
import 'package:random_text_reveal/random_text_reveal.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'Home.view.dart';
import 'Inventario.view.dart';

class MetasView extends StatefulWidget {
  @override
  State<MetasView> createState() => _MetasViewState();
}

class _MetasViewState extends State<MetasView> {
  bool? _checked = false;
  bool isEnabled = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Expanded(
      flex: 5,
      child: Container(
        width: size.width,
        color: Colors.purple[50],
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    leading: Image.asset('assets/imagens/icon_moedas.png'),
                    title: RandomTextReveal(
                      text: 'Ganhe 500 pontos jogando quiz',
                      duration: Duration(seconds: 4),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple[800],
                        fontWeight: FontWeight.bold,
                      ),
                      curve: Curves.decelerate,
                    ),
                    subtitle: Text(
                      'Complete os quizzes disponíveis para ganhar pontos!',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    leading:
                        Image.asset('assets/imagens/icon_info_financas.png'),
                    title: RandomTextReveal(
                      text: 'Aumente suas chances de vendas',
                      duration: Duration(seconds: 4),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple[800],
                        fontWeight: FontWeight.bold,
                      ),
                      curve: Curves.decelerate,
                    ),
                    subtitle: Text(
                      'Descubra como melhorar suas estratégias de vendas.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    leading: Image.asset('assets/imagens/icon_simulador.png'),
                    title: RandomTextReveal(
                      text: 'Simule meses até conseguir 100% de lucro',
                      duration: Duration(seconds: 4),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple[800],
                        fontWeight: FontWeight.bold,
                      ),
                      curve: Curves.decelerate,
                    ),
                    subtitle: Text(
                      'Use a simulação para planejar suas finanças com sucesso.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            // ... outras colunas aqui (caso necessário)
          ],
        ),
      ),
    );
  }
}
