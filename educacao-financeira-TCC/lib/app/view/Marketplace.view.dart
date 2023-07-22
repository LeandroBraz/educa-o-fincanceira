import 'package:flutter/material.dart';

class MarketplaceView extends StatelessWidget {
  final List<String> _listExpl = [
    'Venda x produtos em x dias',
    'Venda x produtos em x dias',
    'Venda x produtos em x dias',
    'Venda x produtos em x dias',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.purple[50],
        child: GridView.builder(
          padding: EdgeInsets.all(100),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 70,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 50.0,
              color: Colors.green[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(right: 5),
                        child: GestureDetector(
                          child: Image.asset(
                              'assets/imagens/icon_interrogacao.png'),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Container(
                                      height: 200,
                                      width: 50,
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  _listExpl[index],
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: TextButton(
                                                      // shape:
                                                      //     RoundedRectangleBorder(
                                                      //         borderRadius:
                                                      //             BorderRadius
                                                      //                 .circular(
                                                      //                     20.0)),
                                                      // color: Colors.green,
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Ok",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      )),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        //   child: Image.asset(_listitem[index]),
                        //         margin: EdgeInsets.only(bottom: 5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              'assets/imagens/icon_carrinho_compras.png'),
                          //         margin: EdgeInsets.only(bottom: 20),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Container(
                                    height: 200,
                                    width: 50,
                                    child: Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                    "Deseja comprar esse item?",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.0),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                child: TextButton(
                                                    // shape:
                                                    //     RoundedRectangleBorder(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     20.0)),
                                                    // color: Colors.red,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Não",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15),
                                                    )),
                                              ),
                                              Container(
                                                child: TextButton(
                                                    // shape:
                                                    //     RoundedRectangleBorder(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(
                                                    //                     20.0)),
                                                    // color: Colors.green,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Sim",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15),
                                                    )),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                      Container(
                          child: Text(
                            "RS: 100,00",
                            style: TextStyle(),
                          ),
                          margin: EdgeInsets.only(left: 10))
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
