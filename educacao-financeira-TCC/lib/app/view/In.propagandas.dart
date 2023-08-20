import 'package:flutter/material.dart';
import '../DAO/localStorage.dart';
import '../model/Usuario.model.dart';

class InPropagandas extends StatefulWidget {
  @override
  State<InPropagandas> createState() => _InPropagandasState();
}

class _InPropagandasState extends State<InPropagandas> {
  Usuario? user; // Declare user as a nullable Usuario

  @override
  void initState() {
    super.initState();
    buscarUsuarioLocal();
  }

  void buscarUsuarioLocal() async {
    Usuario? u = await buscarDadosUsuario(); // Make u nullable too

    setState(() {
      user = u; // Assign the value of u to user
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      child: Image.asset('assets/imagens/icon_moedas.png'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(user?.saldo.toString() ??
                          ''), // Use the user object with null safety
                    ),
                  ],
                ),
              ),
            ),
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
