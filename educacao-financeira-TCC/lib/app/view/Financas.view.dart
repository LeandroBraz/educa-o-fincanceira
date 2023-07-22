import 'package:app_educacao_financeira/app/view/Tabs.view.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class FinancasView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(

            appBar: PreferredSize(
              child: AppBar(

                backgroundColor: Colors.green[800],
                elevation: 0.0,
                bottom: TabBar(

                    isScrollable: true,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    tabs: <Widget>[
                      Tab(
                        text: "Lucro líquido",
                      ),
                      Tab(
                        text: "Despesas",
                      ),
                      Tab(
                        text: "Relatório de Vendas",
                      ),
                      Tab(
                        text: "Fluxo de Caixa",
                      ),
                      Tab(
                       child: IconButton(
                            iconSize: 40,
                            icon: Icon(Icons.keyboard_return_outlined),
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRouter.LOGIN);
                            }),
                      )
                    ]),

              ),
              preferredSize: Size.fromHeight(50.0),
            ),
            body: TabsView()),
      ),
    );
  }
}
