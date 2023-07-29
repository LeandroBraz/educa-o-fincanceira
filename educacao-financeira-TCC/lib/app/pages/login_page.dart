import 'package:flutter/material.dart';
import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:app_educacao_financeira/app/view/ModuloSelecao.dart';
import 'package:flutter/services.dart';
import '../DAO/Auths.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../view/cadastroLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<Usuario> loginUsuario(senha, nome) async {
  var baseUrl =
      "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/usuariosAtivos";

  // Montando a URL com os parâmetros senha e nome
  var url = Uri.parse('$baseUrl/$senha/$nome');

  // Realizando a solicitação HTTP
  var response = await http.get(url);
  print(response);

  if (response.statusCode == 200) {
    // A requisição foi bem-sucedida
    var data = json.decode(response.body);

    return Usuario.fromJson(data);
  } else {
    // A requisição falhou
    throw Exception('Erro: ${response.statusCode}');
  }
}

void _exibirMensagemDeErro(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Erro de login"),
        content: Text("Nome de usuário ou senha inválido."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final myControllerEmail = TextEditingController();
  final auths = Auths();

  static dynamic user = Usuario();
  final nome = TextEditingController();
  final senha = TextEditingController();

  // void salvar() {
  //   setState(() {
  //     widget. user.nome = nome.text.toString();
  //     user.senha = senha.text.toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.purple[600],
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(children: <Widget>[
            SizedBox(
                width: 250,
                height: 250,
                child: Image.asset("assets/imagens/logo_2.png")),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nome,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: senha,
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),

            // TextFormField(
            //   controller: senha,
            //   autofocus: true,
            //   keyboardType: TextInputType.text,
            //   obscureText: true ,
            //   decoration: InputDecoration(
            //       labelText: "Senha",
            //       labelStyle: TextStyle(
            //         color: Colors.black38,
            //         fontWeight:FontWeight.w400,
            //         fontSize: 20,
            //       )
            //   ),
            //   style: TextStyle(
            //       fontSize: 20
            //   ),
            // ),
            // Container(
            //   height: 40,
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     child: Text(
            //       "Recuperar Senha"
            //     ),
            //     onPressed: () {},
            //   ),
            //   ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFF00C853),
                    Color(0xFF2E7D32),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/imagens/bone.png"),
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    // print(_formKey.currentState);
                    if (_formKey.currentState!.validate()) {
                      user = await loginUsuario(
                          senha.text.toString(), nome.text.toString());
                      if (true) {
                        print(user);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ModuloSelecao(user)));
                      } else {
                        _exibirMensagemDeErro(context);
                      }
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: TextButton(
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Cadastro()))
                },
              ),
            ),
          ]),
        ),
      ),
    );
    return Container();
  }
}
