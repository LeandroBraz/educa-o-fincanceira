import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../core/data_general.dart';
import 'SCRIPT_IN_METAS_BASE.dart';

Future<Database> getDatabase() async {
  // await deleteDatabase(
  //     join(await getDatabasesPath(), "projeto_TCC_db")
  // );
  print("ENTROU NO DATABASE");

  return openDatabase(
    join(await getDatabasesPath(), "projeto_TCC_db"),
    onCreate: (db, version) async {
      db.execute(createTableUsuario);
      db.execute(insert1);
      db.execute(createTableVenda);
      db.execute(createTableCanal);
      db.execute(createTableCompra);
      db.execute(createTableFinancas);
      db.execute(createTableProduto);
    },
    version: 1,
  );
}
