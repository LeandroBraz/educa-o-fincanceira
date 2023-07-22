import 'package:app_educacao_financeira/app/routes/app_routes.dart';
import 'package:app_educacao_financeira/app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  final Controller controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                controller.navagationDrawer(1);
              },
              leading: Image.asset('assets/imagens/prancheta.png'),
              title: Text("Metas"),
            ),
            ListTile(
              onTap: () {
                controller.navagationDrawer(2);
              },
              leading: Image.asset('assets/imagens/icon_produto.png'),
              title: Text("Produtos"),
            ),
            ListTile(
              onTap: () {
                controller.navagationDrawer(3);
              },
              leading: Image.asset('assets/imagens/icon_propaganda.png'),
              title: Text("Canais de Propaganda"),
            ),
            ListTile(
              onTap: () {
                controller.navagationDrawer(4);
              },
              leading: Image.asset('assets/imagens/financiamento.png'),
              title: Text("Finanças"),
            ),
            ListTile(
              onTap: () {
                controller.navagationDrawer(5);
              },
              leading: Image.asset('assets/imagens/icon_marketplace.png'),
              title: Text("Marketplace"),
            ),
            ListTile(
              onTap: () {},
              leading: Image.asset('assets/imagens/icon_engrenagem.png'),
              title: Text("Opções"),
            ),
            ListTile(
              onTap: () {
                //         modificarEstado(6);
              },
              leading: Image.asset('assets/imagens/icon_sair.png'),
              title: Text("Sair"),
            ),
          ],
        ),
      ),
    );
  }
}
