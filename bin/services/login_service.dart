import 'dart:developer';

import 'package:password_dart/password_dart.dart';

import '../dtos/auth_dto.dart';
import 'user_service.dart';

class LoginService {
  final UserService _userService;
  LoginService(this._userService);

  Future<int> authenticate(AuthDTO dto) async {
    try {
      var user = await _userService.findByEmail(dto.email);
      if (user == null) return -1;
      return Password.verify(dto.password, user.password!) ? user.id! : -1;
    } catch (e) {
      log('[ERROR] -> In authenticate mathod by email: ${dto.email}');
    }
    return -1;
  }
}
