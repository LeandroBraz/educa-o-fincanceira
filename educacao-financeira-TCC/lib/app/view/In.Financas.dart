import 'package:flutter/material.dart';

import '../DAO/localStorage.dart';
import '../model/Usuario.model.dart';

class InFinancas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
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
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.zero)),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Lucro Líquido",
                      style: TextStyle(fontSize: 10),
                    ),
                    Container(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/imagens/icon_dinheiro.png')),
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.red[400],
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.zero)),
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Text(
                  "Despesas Variáveis",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
