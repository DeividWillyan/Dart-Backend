import '../infra/database/db_configuration.dart';
import '../models/noticia_model.dart';
import 'dao.dart';

class NoticiaDAO implements DAO<NoticiaModel> {
  final DBConfiguration _dbConfiguration;
  NoticiaDAO(this._dbConfiguration);

  @override
  Future<bool> create(NoticiaModel value) async {
    var result = await _dbConfiguration.execQuery(
      'insert into noticias (titulo, descricao, id_usuario) values (?, ?, ?)',
      [value.title, value.description, value.userId],
    );
    return result.affectedRows > 0;
  }

  @override
  Future<bool> delete(int id) async {
    var result = await _dbConfiguration
        .execQuery('DELETE from noticias where id = ?', [id]);
    return result.affectedRows > 0;
  }

  @override
  Future<List<NoticiaModel>> findAll() async {
    var result = await _dbConfiguration.execQuery('SELECT * FROM noticias');
    return result
        .map((r) => NoticiaModel.fromMap(r.fields))
        .toList()
        .cast<NoticiaModel>();
  }

  @override
  Future<NoticiaModel?> findOne(int id) async {
    var result = await _dbConfiguration
        .execQuery('SELECT * FROM noticias where id = ?', [id]);
    return result.isEmpty ? null : NoticiaModel.fromMap(result.first.fields);
  }

  @override
  Future<bool> update(NoticiaModel value) async {
    var result = await _dbConfiguration.execQuery(
      'update noticias set titulo = ?, descricao = ? where id = ?',
      [value.title, value.description, value.id],
    );
    return result.affectedRows > 0;
  }
}
