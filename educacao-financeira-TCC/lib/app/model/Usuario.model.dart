class Usuario {
  String? id;
  String? senha;
  String? nome;
  int? saldo;
  String? sexo;
  String? dataNasc;
  String? uuid;

  Usuario(
      {this.id,
      this.senha,
      this.nome,
      this.saldo,
      this.sexo,
      this.dataNasc,
      this.uuid});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senha = json['senha'];
    nome = json['nome'];
    saldo = json['saldo'];
    sexo = json['sexo'];
    dataNasc = json['data_nasc'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['senha'] = this.senha;
    data['nome'] = this.nome;
    data['saldo'] = this.saldo;
    data['sexo'] = this.sexo;
    data['data_nasc'] = this.dataNasc;
    data['uuid'] = this.uuid;
    return data;
  }
}
