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
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.purple[50],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(20),
                          width: 500,
                          height: size.height * 0.7,
                          decoration: BoxDecoration(
                              color: Colors.green[500],
                              border: Border.all(
                                  color: Color.fromARGB(255, 170, 92, 164),
                                  width: 5)),
                          child: ListView(
                            children:  [
                              CheckboxListTile(
                                title: RandomTextReveal(
                                  text: 'Ganhe 500 pontos  o quiz',
                                  duration: Duration(seconds: 4),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.purple[50],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  curve: Curves.decelerate,
                                ),
                                value: true, // valor do checkbox, aqui sempre será true
                                onChanged: null, // defina como nulo para tornar o item somente leitura
                                activeColor: Colors.purple, // cor do check quando selecionado
                                checkColor: Colors.white, // cor do ícone do check
                                controlAffinity: ListTileControlAffinity.platform, // posição do checkbox em relação ao título
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // preenchimento do item
                                dense: true, // reduzir o tamanho do item
                                enabled: false, // tornar o item não clicável
                              ),
                              CheckboxListTile(
                                title: RandomTextReveal(
                                  text: 'Aumente suas chances de vendas',
                                  duration: Duration(seconds: 4),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.purple[50],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  curve: Curves.decelerate,
                                ),
                                value: true, // valor do checkbox, aqui sempre será true
                                onChanged: null, // defina como nulo para tornar o item somente leitura
                                activeColor: Colors.purple, // cor do check quando selecionado
                                checkColor: Colors.white, // cor do ícone do check
                                controlAffinity: ListTileControlAffinity.platform, // posição do checkbox em relação ao título
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // preenchimento do item
                                dense: true, // reduzir o tamanho do item
                                enabled: false, // tornar o item não clicável
                              ),
                              CheckboxListTile(
                                title: RandomTextReveal(
                                  text: 'Simule meses até conseguir 100% de lucro',
                                  duration: Duration(seconds: 4),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.purple[50],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  curve: Curves.decelerate,
                                ),
                                value: true, // valor do checkbox, aqui sempre será true
                                onChanged: null, // defina como nulo para tornar o item somente leitura
                                activeColor: Colors.purple, // cor do check quando selecionado
                                checkColor: Colors.white, // cor do ícone do check
                                controlAffinity: ListTileControlAffinity.platform, // posição do checkbox em relação ao título
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // preenchimento do item
                                dense: true, // reduzir o tamanho do item
                                enabled: false, // tornar o item não clicável
                              ),

                            ],
                          )
                          ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: GestureDetector(
                          child: Image.asset('assets/imagens/icon_produto.png'),
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Home(
                            //             inventarioAtual: Inventario(
                            //               inventarioCorrente: InProdutos(),
                            //             ),
                            //             telaHome: ProdutoView())));
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: GestureDetector(
                          child:
                              Image.asset('assets/imagens/icon_propaganda.png'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(
                                        Inventario(
                                          InPropagandas(),
                                        ),
                                        CanaisPropag(),
                                        Usuario())));
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: GestureDetector(
                          child: Image.asset(
                              'assets/imagens/icon_marketplace.png'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(
                                        Inventario(
                                          InMarketplace(),
                                        ),
                                        MarketplaceView(),
                                        Usuario())));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
