import 'package:password_dart/password_dart.dart';

import '../dao/usuario_dao.dart';
import '../models/usuario_model.dart';
import 'generic_service.dart';

class UserService implements GenericService<UsuarioModel> {
  final UsuarioDAO _dao;
  UserService(this._dao);

  @override
  Future<bool> delete(int id) async => _dao.delete(id);

  @override
  Future<List<UsuarioModel>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<UsuarioModel> findOne(int id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<bool> save(UsuarioModel value) async {
    final hash = Password.hash(value.password!, PBKDF2());
    value.password = hash;

    return await _dao.create(value);
  }

  Future<UsuarioModel?> findByEmail(String email) async =>
      _dao.findByEmail(email);
}
