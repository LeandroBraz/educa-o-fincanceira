import 'package:app_educacao_financeira/app/widgets/Icon.Interrogation.dart';
import 'package:flutter/material.dart';

class DespesasView extends StatelessWidget {
  void teste() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  DataTable(columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Despesas Fixas',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Valor:',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ], rows: const <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text("Saldo Inicial de Caixa")),
                      DataCell(Text("RS:")),
                    ]),
                    DataRow(selected: true, cells: <DataCell>[
                      DataCell(Text("Total de Entradas")),
                      DataCell(Text("RS:")),
                    ]),
                  ]),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: 10,
                      height: 70,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color: Colors.grey[400],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Despesas Fixas"),
                              IconInterrogation(
                                texto:
                                "São todos os gastos que acontecem independentemente de ocorrer ou não vendas na empresa. São valores gastos com o funcionamento da empresa.",
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RS: 1.200,00",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  DataTable(columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Despeas Variáveis',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Valor:',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ], rows: const <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text("Saldo Inicial de Caixa")),
                      DataCell(Text("RS:")),
                    ]),
                    DataRow(selected: true, cells: <DataCell>[
                      DataCell(Text("Total de Entradas")),
                      DataCell(Text("RS:")),
                    ]),
                  ]),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: 10,
                      height: 70,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color: Colors.grey[400],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Despesas Variáveis"),
                              IconInterrogation(
                                texto:
                                "São aquelas que variam proporcionalmente ao volume produzido ou ao volume vendido, ou seja, só haverá despesa, se houver venda ou unidades produzidas. Exemplo: comissões sobre vendas, impostos.",
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RS: 800,00",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  DataTable(columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Custos com Mercadorias',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Valor:',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ], rows: const <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text("Saldo Inicial de Caixa")),
                      DataCell(Text("RS:")),
                    ]),
                    DataRow(selected: true, cells: <DataCell>[
                      DataCell(Text("Total de Entradas")),
                      DataCell(Text("RS:")),
                    ]),
                  ]),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: 10,
                      //  height: 70,
                      //       color: Colors.red[400],
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color: Colors.red,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  " Total de Despesas + Custos",
                                ),
                              ),
                              IconInterrogation(
                                texto:
                                "É a soma das despesas mais os custos, que são os valores gastos com as compras de mercadorias",
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RS: 200,00",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  DataTable(columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        '',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        '',
                      ),
                    ),
                  ], rows: const <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text("")),
                      DataCell(Text("")),
                    ]),
                  ]),
                ],
              ),
            ]),
      ),
    );
  }
}
