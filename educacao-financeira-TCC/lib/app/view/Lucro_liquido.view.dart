import 'package:app_educacao_financeira/app/widgets/Icon.Interrogation.dart';
import 'package:flutter/material.dart';

class LucroLiView extends StatelessWidget {
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
                    label: Text('Cálculo do Lucro Líquido:'),
                  ),
                  DataColumn(
                    label: Text('Valor:'),
                  ),
                ], rows: const <DataRow>[
                  DataRow(cells: <DataCell>[
                    DataCell(Text("Faturamento")),
                    DataCell(Text("RS:")),
                  ]),
                  DataRow(selected: true, cells: <DataCell>[
                    DataCell(Text("Custos das Mercadorias Vendidas")),
                    DataCell(Text("RS:")),
                  ]),
                  DataRow(selected: true, cells: <DataCell>[
                    DataCell(Text("Lucro Bruto")),
                    DataCell(Text("RS:")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("Despesas Variáveis")),
                    DataCell(Text("RS:")),
                  ]),
                  DataRow(cells: <DataCell>[
                    DataCell(Text("Margem de Contribuição")),
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
                            Text("Lucro Bruto"),
                            IconInterrogation(
                              texto:
                              "Corresponde ao valor obtido no faturamento da empresa,descontados os custos existentes para prover o serviço, produzir ou comprar o produto. Para um varejista, por exemplo, o lucro bruto representa as vendas menos o custo dos bens vendidos.",
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
