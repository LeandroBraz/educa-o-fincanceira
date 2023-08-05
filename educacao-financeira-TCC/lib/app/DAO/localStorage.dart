import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/Usuario.model.dart';

Future<Usuario> buscarDadosUsuario() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userJson = prefs.getString('user');

  if (userJson != null) {
    return Usuario.fromJson(json.decode(userJson));
  } else {
    throw Exception("Usuário não encontrado no local storage.");
  }
}

Future<void> atualizarDadosUsuario(int novoSaldo) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userJson = prefs.getString('user');

  if (userJson != null) {
    Usuario usuario = Usuario.fromJson(json.decode(userJson));
    usuario.saldo = novoSaldo;
    String novoUserJson = json.encode(usuario);
    await prefs.setString('user', novoUserJson);
  } else {
    throw Exception("Usuário não encontrado no local storage.");
  }
}
