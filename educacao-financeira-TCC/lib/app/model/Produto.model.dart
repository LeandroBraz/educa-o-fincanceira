import 'package:app_educacao_financeira/app/model/Categoria.model.dart';

class Produto {
  String nome;
  double preco;
  int quantidade;
  Categoria categoria;

  Produto(this.nome, this.preco, this.quantidade, this.categoria);


}
