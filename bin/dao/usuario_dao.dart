import '../infra/database/db_configuration.dart';
import '../models/usuario_model.dart';
import 'dao.dart';

class UsuarioDAO implements DAO<UsuarioModel> {
  final DBConfiguration _dbConfiguration;
  UsuarioDAO(this._dbConfiguration);

  @override
  Future create(UsuarioModel value) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future delete(int id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UsuarioModel>> findAll() async {
    final String SQL = 'SELECT * FROM usuarios';
    var connection = await _dbConfiguration.connection;
    var result = await connection.query(SQL);
    List<UsuarioModel> _usuarios = [];
    for (var r in result) {
      _usuarios.add(UsuarioModel.fromMap(r.fields));
    }
    return _usuarios;
  }

  @override
  Future<UsuarioModel> findOne(int id) async {
    final String SQL = 'SELECT * FROM usuarios where id = ?';
    var connection = await _dbConfiguration.connection;
    var result = await connection.query(SQL, [id]);
    if (result.length <= 0)
      throw Exception('[ERROR/DB] -> findOne for id: $id, Not Found.');
    return UsuarioModel.fromMap(result.first.fields);
  }

  @override
  Future update(UsuarioModel value) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
