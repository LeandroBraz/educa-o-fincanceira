import 'package:flutter/material.dart';

import '../DAO/dataBaseInMetas.dart';

class InMarketplace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 5),
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/imagens/icon_moedas.png')),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: FutureBuilder(
                        future: buscar(),
                        builder: (context, futuro) {
                          if (futuro.hasData) {
                            var lista = futuro.data;
                            print(lista);
                            return Text(lista!.first["valor"].toString());
                          } else {
                            return Text("00");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.all(2.0),

                //    margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Canais contratados",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
