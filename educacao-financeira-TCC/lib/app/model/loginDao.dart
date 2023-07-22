import 'package:app_educacao_financeira/app/model/Usuario.model.dart';

class loginDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name  TEXT, '
      '$_login TEXT)';

  static const String _tablename = 'Usuario';
  static const String _name = 'nome';
  static const String _login = 'login';

  save(Usuario usuario) async {}
//Future<List<Usuario>> findAll() async{}
  delete(String nomeUser) async {}
}
