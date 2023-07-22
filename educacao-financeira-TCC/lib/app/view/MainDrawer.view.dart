
import 'package:app_educacao_financeira/app/view/Financas.view.dart';
import 'package:app_educacao_financeira/app/view/In.Financas.dart';
import 'package:app_educacao_financeira/app/view/In.marketplace.dart';
import 'package:app_educacao_financeira/app/view/In.propagandas.dart';
import 'package:app_educacao_financeira/app/view/Marketplace.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';
import '../model/Usuario.model.dart';
import 'CanaisPropaganda.view.dart';
import 'Home.view.dart';
import 'In.metas.view.dart';
import 'Inventario.view.dart';
import 'Metas.view.dart';

class MainDrawer extends StatefulWidget {
  final controller = Get.put(Controller());

  Usuario user;

  MainDrawer(this.user);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int _selected = 0;


  void changeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            selected: _selected == 0,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home(

                            Inventario(

                              InMetas(),
                            ), MetasView(),
                            widget.user,
                          )
                      ));
              changeSelected(0);
            },
            leading: Image.asset('assets/imagens/prancheta.png'),
            title: Text("Metas"),
          ),
          // ListTile(
          //   selected: _selected == 1,
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //     //     MaterialPageRoute(
          //     //         builder: (context)
          //     //         => Home(
          //     //         InProdutos(
          //     //
          //     //         InMetas(),
          //     // ), ProdutoView(),
          //     // widget.user,
          //     // )
          //     //     )
          //     );
          //     changeSelected(1);
          //   },
          //   leading: Image.asset('assets/imagens/icon_produto.png'),
          //   title: Text("Produtos"),
          // ),
          ListTile(
            selected: _selected == 2,
            leading: Image.asset('assets/imagens/icon_propaganda.png'),
            title: Text("Canais de Propaganda"),
            onTap: () {
              changeSelected(2);
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home(

                            Inventario(

                              InPropagandas(),
                            ), CanaisPropag(),
                            widget.user,
                          )
                  ));
            },
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home(

                            Inventario(
                              InFinancas(),
                            ), FinancasView(),
                            widget.user,
                          ),
                          ));
            },
            leading: Image.asset('assets/imagens/financiamento.png'),
            title: Text("Finanças"),
          ),
          ListTile(
            leading: Image.asset('assets/imagens/icon_marketplace.png'),
            title: Text("Marketplace"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home(

                            Inventario(

                              InMarketplace(),
                            ), MarketplaceView(),
                            widget.user,
                          )

                          ));
            },
          ),
          ListTile(
            leading: Image.asset('assets/imagens/icon_engrenagem.png'),
            title: Text("Opções"),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset('assets/imagens/icon_sair.png'),
            title: Text("Sair"),
            onTap: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
        ],
      ),
    );
  }
}
