import 'package:flutter/cupertino.dart';

class DadosCompra {
  String? uuid;
  String? uuidUsuario;
  bool? canal_youtube;
  bool? canal_twitter;
  bool? canal_instagram;
  bool? canal_facebook;
  int? produto_servicos;
  int? produto_emergencia;
  int? produto_duraveis;
  int? produto_especiais;

  DadosCompra({
    this.uuid,
    this.uuidUsuario,
    this.canal_youtube,
    this.canal_twitter,
    this.canal_instagram,
    this.canal_facebook,
    this.produto_servicos,
    this.produto_emergencia,
    this.produto_duraveis,
    this.produto_especiais,
  });

  DadosCompra.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    uuidUsuario = json['uuid_usuario'];
    canal_youtube = json['canal_youtube'];
    canal_twitter = json['canal_twitter'];
    canal_instagram = json['canal_instagram'];
    canal_facebook = json['canal_facebook'];
    produto_servicos = json['produto_servicos'];
    produto_emergencia = json['produto_emergencia'];
    produto_duraveis = json['produto_duraveis'];
    produto_especiais = json['produto_especiais'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['uuid_usuario'] = this.uuidUsuario;
    data['canal_youtube'] = this.canal_youtube;
    data['canal_twitter'] = this.canal_twitter;
    data['canal_instagram'] = this.canal_instagram;
    data['canal_facebook'] = this.canal_facebook;
    data['produto_servicos'] = this.produto_servicos;
    data['produto_emergencia'] = this.produto_emergencia;
    data['produto_duraveis'] = this.produto_duraveis;
    data['produto_especiais'] = this.produto_especiais;
    return data;
  }
}
