import 'package:flutter/cupertino.dart';

class DadosCompra {
  String? uuid;
  String? uuidUsuario;
  bool? canalYoutube;
  bool? canalTwitter;
  bool? canalInstagram;
  bool? canalFacebook;
  int? produtoServicos;
  int? produtoEmergencia;
  int? produtoDuraveis;
  int? produtoEspeciais;

  DadosCompra({
    this.uuid,
    this.uuidUsuario,
    this.canalYoutube,
    this.canalTwitter,
    this.canalInstagram,
    this.canalFacebook,
    this.produtoServicos,
    this.produtoEmergencia,
    this.produtoDuraveis,
    this.produtoEspeciais,
  });

  DadosCompra.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    uuidUsuario = json['uuid_usuario'];
    canalYoutube = json['canal_youtube'];
    canalTwitter = json['canal_twitter'];
    canalInstagram = json['canal_instagram'];
    canalFacebook = json['canal_facebook'];
    produtoServicos = json['produto_servicos'];
    produtoEmergencia = json['produto_emergencia'];
    produtoDuraveis = json['produto_duraveis'];
    produtoEspeciais = json['produto_especiais'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['uuid_usuario'] = this.uuidUsuario;
    data['canal_youtube'] = this.canalYoutube;
    data['canal_twitter'] = this.canalTwitter;
    data['canal_instagram'] = this.canalInstagram;
    data['canal_facebook'] = this.canalFacebook;
    data['produto_servicos'] = this.produtoServicos;
    data['produto_emergencia'] = this.produtoEmergencia;
    data['produto_duraveis'] = this.produtoDuraveis;
    data['produto_especiais'] = this.produtoEspeciais;
    return data;
  }
}
