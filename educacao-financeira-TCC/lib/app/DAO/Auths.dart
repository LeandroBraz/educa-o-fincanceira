import 'dart:ffi';

import 'package:app_educacao_financeira/app/DAO/dataBaseInMetas.dart';
import 'package:sqflite/sqflite.dart';

import '../DAO/databse.dart';
import '../model/Usuario.model.dart';
import '../model/homeModel.dart';

class Auths {
  static Usuario _user = Usuario();

  static Future<bool> loginAuths(String nome, String senha) async {
    bool valid = false;

    List<Map<String, dynamic>> resultados = await buscarLogin(nome, senha);

    for (Map<String, dynamic> linha in resultados) {
      String nome = linha['NOME'];
      String senha = linha['SENHA'];
      String uuid = linha['UUID'];
      int saldo = linha['SALDO'];

      _user = Usuario(
        nome: nome,
        uuid: uuid,
        saldo: saldo,
        senha: senha,
      );

      valid = true;
      print(valid);
    }

    if (valid) {
      return true;
    } else {
      return false;
    }
  }

  static bool get isLoggedIn => _user != null;

  static Usuario get currentUser => _user;

  static void logout() {
    _user = _user = Usuario(
      nome: "",
      uuid: "",
      saldo: 0,
      senha: "",
    );
  }
}
