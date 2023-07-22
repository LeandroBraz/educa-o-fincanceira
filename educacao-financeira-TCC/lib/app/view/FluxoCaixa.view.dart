import 'package:app_educacao_financeira/app/widgets/Icon.Interrogation.dart';
import 'package:flutter/material.dart';

class FluxoCaixaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                DataTable(columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Item'),
                  ),
                  DataColumn(
                    label: Text('Valor:'),
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
                  DataRow(selected: true, cells: <DataCell>[
                    DataCell(Text("Total de Saídas")),
                    DataCell(Text("RS:")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("Saldo Operacional")),
                    DataCell(Text("RS:")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("Saldo Final")),
                    DataCell(Text("RS:")),
                  ]),
                ]),
                Expanded(
                  flex: 10,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "RS: 60%",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Lucratividade")],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      // color: Colors.grey[400],
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          color: Colors.grey[400],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "RS: 0",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0),
                              ),
                              IconInterrogation(
                                texto:
                                "Mostra o quanto é necessário vender para que as receitas se igualem aos custos; que indica em que momento, a partir das projeções de vendas do empreendedor, a empresa estará igualando suas receitas e seus custos.",
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Ponto de Equilíbrio")],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
