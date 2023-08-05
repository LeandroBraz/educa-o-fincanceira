import 'package:flutter/cupertino.dart';

class ObjetoGenerico {
  String? nome;
  int? preco;
  bool? ativo;

  ObjetoGenerico({this.nome, this.preco, this.ativo});

  ObjetoGenerico.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    preco = json['preco'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['preco'] = this.preco;
    data['ativo'] = this.ativo;
    return data;
  }
}
