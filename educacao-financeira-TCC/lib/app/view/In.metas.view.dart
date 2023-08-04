import 'package:app_educacao_financeira/app/DAO/SCRIPT_IN_METAS_BASE.dart';
import 'package:app_educacao_financeira/app/DAO/databse.dart';
import 'package:app_educacao_financeira/app/data/home_dao.dart';
import 'package:app_educacao_financeira/app/model/homeModel.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../DAO/Auths.dart';

import '../DAO/dataBaseInMetas.dart';
import '../DAO/localStorage.dart';
import '../model/Usuario.model.dart';

class InMetas extends StatefulWidget {
  @override
  State<InMetas> createState() => _InMetasState();
}

class _InMetasState extends State<InMetas> {
  final auths = Auths();

  // Future<List<Map<String,dynamic>>> _buscar() async {
  //    // await deleteDatabase(
  //    //     join(await getDatabasesPath(), "projeto_TCC_db")
  //    // );
  //
  //   String path =  join( await getDatabasesPath(), "projeto_TCC_db");
  //   Database db = await openDatabase(
  //     path,
  //   version: 1,
  //     onCreate: (db, v){
  //       db.execute(createTable);
  //       db.execute(insert1);
  //     }
  //   );
  //   var retorno = db.query("HOME", where: 'UUID = ?', whereArgs: ["0484fbb0-afcc-11ed-afa1-0242ac120002"]);
  //  print("buscado dados no banco");
  //  print(retorno);
  //   return retorno;
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                // decoration: BoxDecoration(
                //     color: Colors.grey,
                //     border: Border.all(
                //       color: Color.fromARGB(255, 0, 0, 0),
                //       width: 2,
                //     ),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey,
                //       blurRadius: 4.0,
                //       spreadRadius: 2.0)
                // ],
                //     borderRadius: BorderRadius.all(Radius.circular(5.0))),
                // margin: EdgeInsets.only(top: 15, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 5, top: 10),
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
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(left: 10),
              child: GestureDetector(
                child: Image.asset('assets/imagens/icon_companhia.png'),
                onTap: () {
                  print("teste");
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(left: 10),
              child: GestureDetector(
                child: Image.asset('assets/imagens/icon_calendario.png'),
                onTap: () {
                  print("teste");
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
