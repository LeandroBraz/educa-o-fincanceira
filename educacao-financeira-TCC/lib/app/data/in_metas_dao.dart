// import 'package:app_educacao_financeira/app/view/In.metas.view.dart';
// import 'package:sqflite/sqflite.dart';
// import '../DAO/dataBaseInMetas.dart';
//
// class InMetasDao {
//   static const String tableSql = 'CREATE TABLE $_tablename('
//       '$_uuid TEXT, '
//       '$_valor INTEGER, ';
//
//   static const String _tablename = 'INMETAS';
//   static const String _uuid = 'uuid';
//   static const String _valor = 'valor';
//
//   save(InMetas home) async {
//     print('Iniciando o save: ');
//     final Database bancoDeDados = await getDatabase();
//     var itemExists = await find(home.uuid);
//     Map<String, dynamic> InMetasMap = toMap(home);
//     if (itemExists.isEmpty) {
//       print('a Tarefa não Existia.');
//       return await bancoDeDados.insert(_tablename, InMetasMap);
//     } else {
//       print('a Tarefa existia!');
//       return await bancoDeDados.update(
//         _tablename,
//         InMetasMap,
//         where: '$_uuid = ?',
//         whereArgs: [home.uuid],
//       );
//     }
//   }
//
//   Map<String, dynamic> toMap(InMetas tarefa) {
//     print('Convertendo to Map: ');
//     final Map<String, dynamic> mapaDeTarefas = Map();
//     // mapaDeTarefas[_name] = tarefa.nome;
//     mapaDeTarefas[_valor] = tarefa.valor;
//     //mapaDeTarefas[_image] = tarefa.foto;
//     print('Mapa de Tarefas: $mapaDeTarefas');
//     return mapaDeTarefas;
//   }
//
//   Future<List<InMetas>> findAll() async {
//     print('Acessando o findAll: ');
//     final Database bancoDeDados = await getDatabase();
//     final List<Map<String, dynamic>> result =
//         await bancoDeDados.query(_tablename);
//     print('Procurando dados no banco de dados... encontrado: $result');
//     return toList(result);
//   }
//
//   List<InMetas> toList(List<Map<String, dynamic>> mapaDeTarefas) {
//     print('Convertendo to List:');
//     final List<InMetas> tarefas = [];
//     for (Map<String, dynamic> linha in mapaDeTarefas) {
//       print(linha[_uuid]);
//       final InMetas tarefa = InMetas(
//         linha[_valor],
//         linha[_uuid],
//       );
//       print("oi");
//       tarefas.add(tarefa);
//     }
//     print('Lista de Tarefas: ${tarefas.toString()}');
//     return tarefas;
//   }
//
//   Future<List<InMetas>> find(String uuidDaTarefa) async {
//     print('Acessando find: ');
//     final Database bancoDeDados = await getDatabase();
//     print('Procurando tarefa com o nome: ${uuidDaTarefa}');
//     final List<Map<String, dynamic>> result = await bancoDeDados
//         .query(_tablename, where: '$_uuid = ?', whereArgs: [uuidDaTarefa]);
//     print('Tarefa encontrada: ${toList(result)}');
//
//     return toList(result);
//   }
//
//
//
//   // Future<List<InMetas>> findGET(String uuidDaTarefa) async {
//   //   print('Acessando find: ');
//   //   final Database bancoDeDados = await getDatabase();
//   //   print('Procurando tarefa com o nome: ${uuidDaTarefa}');
//   //   final List<Map<String, dynamic>> result = await bancoDeDados
//   //       .query(_tablename, where: '$_uuid = ?', whereArgs: [uuidDaTarefa]);
//   //   print('Tarefa encontrada: ${toList(result)}');
//   //
//   //   return result;
//   // }
//
//   delete(String nomeDaTarefa) async {
//     print('Deletando tarefa: $nomeDaTarefa');
//     final Database bancoDeDados = await getDatabase();
//     return await bancoDeDados.delete(
//       _tablename,
//       where: '$_valor = ?',
//       whereArgs: [nomeDaTarefa],
//     );
//   }
//
//   insertExclusivoInMetas() async {
//     final Database bancoDeDados = await getDatabase();
//     print('Insert Exclusivo.');
//     var home = {"valor": 0, "uuid": "0484fbb0-afcc-11ed-afa1-0242ac120002"};
//     // const sql  = ""
//     return await bancoDeDados.insert(_tablename, home);
//   }
// }
