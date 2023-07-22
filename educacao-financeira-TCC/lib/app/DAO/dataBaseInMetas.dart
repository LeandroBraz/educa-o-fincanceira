import 'package:app_educacao_financeira/app/DAO/SCRIPT_DATA_BASE.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../core/data_general.dart';
// import 'SCRIPT_IN_METAS_BASE.dart';
import 'databse.dart';

Future<List<Map<String, dynamic>>> buscar() async {
  final Database db = await getDatabase();
  var retorno = db.query("USUARIO",
      where: 'UUID = ?', whereArgs: ["0484fbb0-afcc-11ed-afa1-0242ac120002"]);
  print("buscado dados no banco");
  print(retorno);
  return retorno;
}

Future<List<Map<String, dynamic>>> buscarLogin(nome, senha) async {
  final Database db = await getDatabase();
  var retorno = db.query("USUARIO",
      where: 'NOME = ? AND SENHA = ?', whereArgs: [nome, senha]);
  print("buscado dados no banco");
  print(retorno);
  return retorno;
}

Future upDate(int totalAcerto, String uuid, nome, senha) async {
  final Database db = await getDatabase();
  await db.update(
    "USUARIO",
    toMap(uuid, nome, totalAcerto, senha),
    where: "uuid = ?",
    whereArgs: [uuid],
  );
}

Future SalvarUsuario(
  String uuid,
  String nome,
  String senha,
  int saldo,
) async {
  final Database db = await getDatabase();
  print(toMap(
    uuid,
    nome,
    senha,
    saldo,
  ));
  await db.insert(
    "USUARIO",
    toMap(
      uuid,
      nome,
      senha,
      saldo,
    ),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Map<String, dynamic> toMap(uuid, nome, saldo, senha) {
  return {
    'uuid': uuid,
    'nome': nome,
    'senha': senha,
    'saldo': saldo,
  };
}
