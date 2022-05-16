import 'dart:developer';

import 'package:password_dart/password_dart.dart';

import '../to/auth_to.dart';
import 'usuario_service.dart';

class LoginService {
  final UsuarioService _usuarioService;
  LoginService(this._usuarioService);

  Future<int> authenticate(AuthTO to) async {
    try {
      var user = await _usuarioService.findByEmail(to.email);
      if (user == null) return -1;
      return Password.verify(to.password, user.password!) ? user.id! : -1;
    } catch (e) {
      log('[ERROR] -> in Authenticate method by email ${to.email}');
    }
    return -1;
  }
}
