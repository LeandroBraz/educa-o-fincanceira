import 'package:flutter/cupertino.dart';

class ObjetoGenerico {
  String? nome;
  int? preco;
  bool? ativo;
  int? qtd;

  ObjetoGenerico(
      {required this.nome,
      required this.preco,
      required this.ativo,
      required this.qtd});

  ObjetoGenerico.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    preco = json['preco'];
    ativo = json['ativo'];
    qtd = json['qtd'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['preco'] = this.preco;
    data['ativo'] = this.ativo;
    data['qtd'] = this.qtd;
    return data;
  }
}
