// import 'dart:io';

import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/view/InfoPages.view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final myControllerEmail = TextEditingController();

  final nomeControler = TextEditingController();

  static Usuario user = Usuario();

  void salvar() {
    setState(() {
      user.nome = nomeControler.text.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(
              top: 40,
              left: 40,
              right: 40,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 128,
                  height: 128,
                  child: Image.asset("assets/imagens/empreendedor.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      child: TextFormField(
                        controller: nomeControler,
                        decoration: InputDecoration(
                          labelText: "Nick",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                        style: TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "O campo é obrigatório";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.bottomRight,
                              begin: Alignment.topLeft,
                              stops: [
                                0.3,
                                1
                              ],
                              colors: [
                                Color(0xFFF58524),
                                Color(0xFFF92B7F),
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              salvar();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InfoPages(user)));
                            }
                          },
                          child: Text(
                            "Iniciar",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                    ),
                    SizedBox(
                      width: 30,
                    ),


                    // Container(
                    //   width: 150,
                    //   height: 50,
                    //   padding: EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //       color: Color(0xFF3C5A99),
                    //       borderRadius: BorderRadius.all(Radius.circular(30))),
                    //   child: TextButton(
                    //       // shape: RoundedRectangleBorder(
                    //       //     borderRadius: BorderRadius.circular(20.0)),
                    //       onPressed: () {
                    //         SystemChannels.platform
                    //             .invokeMethod('SystemNavigator.pop');
                    //       },
                    //       child: Text(
                    //         "Sair",
                    //         style: TextStyle(color: Colors.white, fontSize: 30),
                    //       )),
                    // ),
                    // SizedBox(
                    //   width: 30,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
