import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Usuario.model.dart';

Future<Usuario> buscarDadosUsuario() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userJson = prefs.getString('user');

  if (userJson != null) {
    atualizarDadosUsuarioNoStream(Usuario.fromJson(json.decode(userJson)));
    return Usuario.fromJson(json.decode(userJson));
  } else {
    throw Exception("Usuário não encontrado no local storage.");
  }
}

Future<void> atualizarDadosUsuario(int novoSaldo, {int? fase}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userJson = prefs.getString('user');

  if (userJson != null) {
    Map<String, dynamic> userMap = json.decode(userJson);
    Usuario usuario = Usuario.fromJson(userMap);
    usuario.saldo = novoSaldo;
    fase != null ? usuario.fase = fase : print("Fase nula");
    String novoUserJson = json.encode(usuario.toJson());
    await prefs.setString('user', novoUserJson);
  } else {
    throw Exception("Usuário não encontrado no local storage.");
  }
}

final userStreamController = StreamController<Usuario>.broadcast();

// Esta função será chamada sempre que os dados do usuário forem atualizados
void atualizarDadosUsuarioNoStream(Usuario usuario) {
  userStreamController.sink.add(usuario);
}

// Certifique-se de fechar o StreamController quando ele não for mais necessário
void disposeUserStreamController() {
  userStreamController.close();
}
