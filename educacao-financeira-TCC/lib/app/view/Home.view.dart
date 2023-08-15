import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/model/Produto.model.dart';
import 'package:app_educacao_financeira/app/routes/app_routes.dart';
import 'package:app_educacao_financeira/app/ui/maindrawer.dart';
import 'package:app_educacao_financeira/app/view/Financas.view.dart';
import 'package:app_educacao_financeira/app/view/In.marketplace.dart';
import 'package:app_educacao_financeira/app/view/CanaisPropaganda.view.dart';
import 'package:app_educacao_financeira/app/view/In.metas.view.dart';
import 'package:app_educacao_financeira/app/view/In.propagandas.dart';
import 'package:app_educacao_financeira/app/view/Inventario.view.dart';
import 'package:app_educacao_financeira/app/view/Produtos.view.dart';
import 'package:app_educacao_financeira/app/view/quiz.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:app_educacao_financeira/app/controller/controller.dart';

import '../DAO/Auths.dart';
import '../DAO/dataBaseInMetas.dart';
import 'ProdutosList.dart';

class Home extends StatefulWidget {
  final controller = Get.put(Controller());

  Widget telaHome;
  Widget inventarioAtual;

  Usuario user;

  Home(this.inventarioAtual, this.telaHome, this.user);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MainDrawer mainDrawer = MainDrawer();
  bool mostrarQuiz = true;
  bool mostrarFase1 = false;
  bool mostrarFase2 = false;
  bool mostrarFase3 = false;

  // buscarInformacao() async {
  //   var usuario =
  //       await buscarLogin(Auths.currentUser.nome, Auths.currentUser.senha);
  //   print(usuario);
  //   setState(() {
  //     //  mostrarQuiz = usuario[0]["SALDO"] > 500;
  //   });
  // }

  _openPopup(context) {
    Alert(
        style: AlertStyle(backgroundColor: Colors.purple[50]),
        context: context,
        title: "Usuário:",
        content: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20), child: Text(widget.user.nome!)),
          ],
        ),
        buttons: [
          DialogButton(
            color: Colors.green[300],
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  void modificarEstado(int index) {
    print("modificar estado");
    setState(() {
      switch (index) {
        case 1:
          widget.telaHome = widget.controller.metasView;
          widget.inventarioAtual = Inventario(InMetas());

          break;
        // case 2:
        //   widget.telaHome = widget.controller.prodList;
        //   widget.inventarioAtual = Inventario(ProdList());
        //   break;
        case 3:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Quiz(widget.user)));
          break;
        case 4:
          widget.telaHome = widget.controller.canaisPropag;
          widget.inventarioAtual = Inventario(InPropagandas());

          break;

        case 5:
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => FinancasView()));
          // widget.telaHome = widget.controller.financasView;
          // widget.inventarioAtual = Inventario(FinancasView());
          break;

        case 6:
          widget.telaHome = widget.controller.marketplaceView;
          widget.inventarioAtual = Inventario(InMarketplace());
          break;

        case 7:
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          break;

        case 8:
          break;
        default:
      }
    });
  }

  void teste() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // // SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setEnabledSystemUIMode([[{}]]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        actions: [
          IconButton(
              iconSize: 40,
              icon: Icon(Icons.keyboard_return_outlined),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRouter.LOGIN);
              }),
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                _openPopup(context);
              }),
        ],
      ),
      body: Row(
        children: <Widget>[widget.inventarioAtual, widget.telaHome],
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  modificarEstado(1);
                },
                leading: Image.asset('assets/imagens/prancheta.png'),
                title: Text("Metas"),
              ),
              Visibility(
                  visible: false,
                  child: ListTile(
                    onTap: () {
                      modificarEstado(2);
                    },
                    leading: Image.asset('assets/imagens/icon_produto.png'),
                    title: Text("Produtos"),
                  )),
              Visibility(
                visible: true,
                child: ListTile(
                  onTap: () {
                    modificarEstado(3);
                  },
                  leading: Image.asset('assets/imagens/icon_quiz.png'),
                  title: Text("Quiz"),
                ),
              ),
              ListTile(
                onTap: () {
                  modificarEstado(4);
                },
                leading: Image.asset('assets/imagens/icon_propaganda.png'),
                title: Text("Canais de Propaganda"),
              ),
              ListTile(
                onTap: () {
                  modificarEstado(5);
                },
                leading: Image.asset('assets/imagens/financiamento.png'),
                title: Text("Finanças"),
              ),
              ListTile(
                onTap: () {
                  modificarEstado(6);
                },
                leading: Image.asset('assets/imagens/icon_produto.png'),
                title: Text("Produtos"),
                // leading: Image.asset('assets/imagens/icon_marketplace.png'),
                // title: Text("Marketplace"),
              ),
              ListTile(
                onTap: () {},
                leading: Image.asset('assets/imagens/icon_engrenagem.png'),
                title: Text("Opções"),
              ),
              ListTile(
                onTap: () {
                  modificarEstado(8);
                },
                leading: Image.asset('assets/imagens/icon_sair.png'),
                title: Text("Sair"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
