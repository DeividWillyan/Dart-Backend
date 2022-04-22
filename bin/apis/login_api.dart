import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../dtos/auth_dto.dart';
import '../infra/security/security_service.dart';

import '../services/login_service.dart';
import 'api.dart';

class LoginApi extends Api {
  final SecurityService _securityService;
  final LoginService _loginService;
  LoginApi(this._securityService, this._loginService);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    Router router = Router();

    router.post('/login', (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) return Response(401);
      var authDTO = AuthDTO.fromRequest(body);

      var userId = await _loginService.authenticate(authDTO);
      if (userId > 0) {
        var jwt = await _securityService.generateJWT(userId.toString());
        return Response(200, body: jsonEncode({'token': jwt}));
      } else {
        return Response(401);
      }
    });

    return createHandler(
      router: router,
      middlewares: middlewares,
    );
  }
}
