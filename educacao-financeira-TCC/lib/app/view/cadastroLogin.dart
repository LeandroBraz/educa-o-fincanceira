import 'dart:convert';

import 'package:app_educacao_financeira/app/model/Usuario.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import '../DAO/SCRIPT_IN_METAS_BASE.dart';
import '../DAO/dataBaseInMetas.dart';
import '../pages/login_page.dart';
import 'package:uuid/uuid.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

void _exibemensagemDeCadastro(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Cadastro Realizado"),
        content: Text("Cadastro Realizado com sucesso"),
        actions: [
          TextButton(
            child: Text("ir para Login"),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      );
    },
  );
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nome = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final TextEditingController confirmacaoSenha = TextEditingController();
  final TextEditingController dataNascimento = TextEditingController();
  String? sexoValue;

  String _applyDateFormat(String value) {
    if (value.length <= 2) {
      return value;
    } else if (value.length <= 4) {
      return '${value.substring(0, 2)}/${value.substring(2)}';
    } else if (value.length <= 6) {
      return '${value.substring(0, 2)}/${value.substring(2, 4)}/${value.substring(4)}';
    } else if (value.length <= 8) {
      return '${value.substring(0, 2)}/${value.substring(2, 4)}/${value.substring(4, 8)}';
    } else {
      return '${value.substring(0, 2)}/${value.substring(2, 4)}/${value.substring(4, 8)}';
    }
  }

  void validarSenhas(context) {
    String senhaDigitada = senha.text;
    String confirmacaoDigitada = confirmacaoSenha.text;

    if (senhaDigitada == confirmacaoDigitada) {
      cadastrar(context);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Senhas diferentes"),
            actions: [
              TextButton(
                child: Text("ok"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  void cadastrar(context) async {
    String apiUrl =
        "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/usuariosAtivos";
    Uuid uuid = Uuid();
    String myUuid = uuid.v4();

    Map<String, dynamic> userData = {
      "senha": senha.text.toString(),
      "nome": nome.text.toString(),
      "saldo": 0,
      "sexo": sexoValue,
      "data_nasc": dataNascimento.text.toString(),
      "uuid": myUuid,
      "fase": "fase1"
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(userData),
      );

      if (response.statusCode == 200) {
        cadastrarDadosCompra(context, myUuid);
      } else {
        throw Exception("Falha ao adicionar usuário: ${response.statusCode}");
      }
    } catch (e) {
      print('Erro: $e');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(
                "Cadastro não Realizado, ocorreu um problema com os dados"),
            actions: [
              TextButton(
                child: Text("ok"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  void cadastrarDadosCompra(context, uuidUser) async {
    String apiUrl =
        "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/dadosCompra";
    Uuid uuid = Uuid();
    String myUuid = uuid.v4();

    Map<String, dynamic> dadosCompraData = {
      "canal_youtube": false,
      "canal_twitter": false,
      "canal_instagram": false,
      "canal_facebook": false,
      "produto_servicos": 0,
      "produto_emergencia": 0,
      "produto_duraveis": 0,
      "produto_especiais": 0,
      "uuid": myUuid,
      "uuid_usuario": uuidUser,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(dadosCompraData),
      );

      if (response.statusCode == 200) {
        _exibemensagemDeCadastro(context);
      } else {
        throw Exception(
            "Falha ao adicionar dadosCompra: ${response.statusCode}");
      }
    } catch (e) {
      print('Erro: $e');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(
                "Cadastro não Realizado, ocorreu um problema com os dados de compra"),
            actions: [
              TextButton(
                child: Text("ok"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
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
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: senha,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: confirmacaoSenha,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirmação de Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: dataNascimento,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    // Implementing the date format mask
                    final newString = _applyDateFormat(newValue.text);
                    return TextEditingValue(
                      text: newString,
                      selection:
                          TextSelection.collapsed(offset: newString.length),
                    );
                  }),
                ],
                decoration: InputDecoration(
                  labelText: "Data de Nascimento (DD/MM/AAAA)",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              DropdownButtonFormField<String>(
                value: sexoValue,
                onChanged: (newValue) {
                  setState(() {
                    sexoValue = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'M',
                    child: Text('Masculino'),
                  ),
                  DropdownMenuItem(
                    value: 'F',
                    child: Text('Feminino'),
                  ),
                ],
                decoration: InputDecoration(
                  labelText: "Sexo",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [Color(0xFF00C853), Color(0xFF2E7D32)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Cadastrar",
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        validarSenhas(context);
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
                    "Login",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()))
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
