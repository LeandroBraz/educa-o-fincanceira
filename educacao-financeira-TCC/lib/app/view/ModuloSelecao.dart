import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/view/InfoPages.view.dart';
import 'package:flutter/material.dart';

class ModuloSelecao extends StatelessWidget {
  Usuario user;

  ModuloSelecao(this.user);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: Container(),
        title: Text('Seleção de Modulos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 245,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[400]),
                          ),
                          child: Text(
                            "Educação Básica",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoPages(user))),
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 245,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green[100]),
                          ),
                          child: Text(
                            "Aprender Sobre Investimenstos",
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () => {},
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
