import 'package:sqflite/sqflite.dart';

import '../DAO/databse.dart';
import '../model/homeModel.dart';

class HomeDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_uuid TEXT, '
      '$_valor INTEGER)';

  static const String _tablename = 'home';
  static const String _uuid = 'uuid';
  static const String _valor = 'valor';
  //static const String _image = 'image';

  save(HomeModel tarefa) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();

    var itemExists = await find(tarefa.uuid);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('a Tarefa não Existia.');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('a Tarefa existia!');
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_uuid = ?',
        whereArgs: [tarefa.uuid],
      );
    }
  }

  Map<String, dynamic> toMap(HomeModel tarefa) {
    print('Convertendo to Map: ');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_uuid] = tarefa.uuid;
    mapaDeTarefas[_valor] = tarefa.valor;
//    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<HomeModel>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<HomeModel> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List:');
    final List<HomeModel> tarefas = [];
    var tarefa;
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      // final  tarefa = HomeModel(
      //   linha[_uuid],
      //   linha[_valor],
      // );
      tarefa = {"uud": linha[_uuid], "valor": linha[_valor]};
      tarefas.add(tarefa);
    }

    tarefas.add(tarefa);

    print('Lista de Tarefas: ${tarefas.toString()}');
    return tarefas;
  }

  Future<List<HomeModel>> find(String nomeDaTarefa) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    print('Procurando tarefa com o uuid: ${nomeDaTarefa}');
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_uuid = ?', whereArgs: [nomeDaTarefa]);
    print('Tarefa encontrada: ${toList(result)}');

    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.delete(
      _tablename,
      where: '$_uuid = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
