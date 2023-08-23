import 'package:app_educacao_financeira/app/DAO/localStorage.dart';
import 'package:app_educacao_financeira/app/view/Home.view.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app_educacao_financeira/app/DAO/SCRIPT_IN_METAS_BASE.dart';
import 'package:http/http.dart' as http;
import '../DAO/api.dao.dart';
import '../model/Usuario.model.dart';
import 'In.metas.view.dart';
import 'Inventario.view.dart';
import 'Metas.view.dart';
import 'package:app_educacao_financeira/app/DAO/dataBaseInMetas.dart';

class Resultado extends StatefulWidget {
  const Resultado(this.acertos, this.user, {Key? key}) : super(key: key);
  final Usuario user;
  final int acertos;

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: Container(),
        title: const Text('Resultado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Resutado",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Você Acertou ${widget.acertos} de 10\nperguntas ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 500,
                child: ElevatedButton(
                  onPressed: () {
                    updateValor(widget.user.uuid, (widget.acertos * 100));
                    //    atualizarDadosUsuario(widget.acertos * 100, fase: 'fase2');
                    if (widget.acertos >= 5) {
                      updateFase(widget.user.uuid, 2);
                      atualizarDadosUsuario(widget.acertos * 100, fase: 2);
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(
                                  Inventario(
                                    InMetas(),
                                  ),
                                  MetasView(),
                                  widget.user,
                                )));
                  },
                  child: Text(
                    "Resgatar Prêmio",
                    style: TextStyle(fontSize: 40),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[300]),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
