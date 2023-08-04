import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DAO/dataBaseInMetas.dart';
import '../DAO/localStorage.dart';
import '../model/Usuario.model.dart';

// Future<Usuario> buscarDadosUsuario() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? userJson = prefs.getString('user');

//   if (userJson != null) {
//     return Usuario.fromJson(json.decode(userJson));
//   } else {
//     throw Exception("Usuário não encontrado no local storage.");
//   }
// }

class InPropagandas extends StatelessWidget {
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
                      child: FutureBuilder<Usuario>(
                        future: buscarDadosUsuario(),
                        builder: (context, futuro) {
                          if (futuro.hasData) {
                            var usuario = futuro.data;
                            print(usuario);
                            return Text(usuario!.saldo.toString());
                          } else if (futuro.hasError) {
                            // Lidar com o erro, por exemplo, exibindo uma mensagem de erro na interface
                            return Text("Erro ao carregar dados do usuário.");
                          } else {
                            // Caso ainda esteja carregando os dados do usuário, pode exibir um indicador de progresso, por exemplo:
                            return CircularProgressIndicator();
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
