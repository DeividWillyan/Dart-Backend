import 'dart:convert';

import 'package:shelf/shelf.dart';

import 'package:shelf_router/shelf_router.dart';

import '../models/usuario_model.dart';
import '../services/usuario_service.dart';
import 'api.dart';

class UsuarioApi extends Api {
  final UsuarioService _usuarioService;
  UsuarioApi(this._usuarioService);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    final router = Router();

    router.post('/user', (Request req) async {
      var body = await req.readAsString();
      if (body.isEmpty) return Response(400);
      var user = UsuarioModel.fromRequest(jsonDecode(body));
      var result = await _usuarioService.save(user);
      return result ? Response(201) : Response(500);
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
