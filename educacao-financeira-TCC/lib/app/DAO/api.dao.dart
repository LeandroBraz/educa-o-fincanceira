import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app_educacao_financeira/app/DAO/SCRIPT_IN_METAS_BASE.dart';
import 'package:http/http.dart' as http;

import '../model/Usuario.model.dart';
import '../model/dadosCompra.dart';
import 'localStorage.dart';

Future<bool> updateValor(uuid, saldo) async {
  var baseUrl =
      "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/atualizarSaldo";

  // Montando a URL com os parâmetros senha e nome
  var url = Uri.parse('$baseUrl/$uuid/$saldo');
  var response = await http.patch(url);

  if (response.statusCode == 200) {
    return true;
  } else {
    print('Erro: ${response.statusCode}');
    return false;
    // A requisição falhou

  }
}

Future<bool> atualizaCompra(uuid, valor, campo) async {
  var baseUrl =
      "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/atualizarinformacao";

  // Montando a URL com os parâmetros senha e nome
  var url = Uri.parse('$baseUrl/$uuid/$valor/$campo');
  print(url);
  var response = await http.patch(url);

  if (response.statusCode == 200) {
    return true;
  } else {
    print('Erro: ${response.statusCode}');
    return false;
    // A requisição falhou

  }
}

//Metodo GET de  de dadosCompra
Future<DadosCompra> getDadosCompra() async {
  Usuario u = await buscarDadosUsuario();
  print(u.uuid);
  String url =
      "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/dadosCompra/${u.uuid}/";

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final dadosCompra = DadosCompra.fromJson(json);
    return dadosCompra;
  } else {
    throw Exception('Failed to load dados compra');
  }
}

Future<bool> updateFase(uuid, fase) async {
  var baseUrl =
      "https://us-central1-budgetboss-ed3a1.cloudfunctions.net/api/atualizarFase";

  // Montando a URL com os parâmetros senha e nome
  var url = Uri.parse('$baseUrl/$uuid/$fase');
  var response = await http.patch(url);

  if (response.statusCode == 200) {
    return true;
  } else {
    print('Erro: ${response.statusCode}');
    return false;
    // A requisição falhou

  }
}
