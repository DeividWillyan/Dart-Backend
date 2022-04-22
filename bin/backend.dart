import 'package:password_dart/password_dart.dart';
import 'package:shelf/shelf.dart';

import 'apis/blog_api.dart';
import 'apis/login_api.dart';
import 'apis/user_api.dart';
import 'dao/usuario_dao.dart';
import 'infra/custom_server.dart';
import 'infra/dependency_injector/injects.dart';
import 'infra/middleware_interception.dart';
import 'models/usuario_model.dart';
import 'utils/custom_env.dart';

void main() async {
  CustomEnv.fromFile('.env-dev');

  final _di = Injects.initialize();

  // var usuarioModel = UsuarioModel()
  //   ..id = 7
  //   ..name = 'Julio'
  //   ..email = 'julio@email.com';

  // UsuarioDAO _usuarioDAO = _di<UsuarioDAO>();
  // await _usuarioDAO.create(usuarioModel).then(print);
  // await _usuarioDAO.findAll().then(print);
  // await _usuarioDAO.findOne(1).then(print);
  // await _usuarioDAO.update(usuarioModel).then(print);
  // await _usuarioDAO.delete(6).then(print);

  var cascadeHandler = Cascade()
      .add(_di.get<LoginApi>().getHandler())
      .add(_di.get<UserApi>().getHandler(isSecurity: true))
      .add(_di.get<BlogApi>().getHandler(isSecurity: true))
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests()) // global Middlewares
      .addMiddleware(MiddlewareInterception().middlerware) // global Middlewares
      .addHandler(cascadeHandler);

  await CustomServer().initialize(
    handler: handler,
    address: await CustomEnv.get<String>(key: 'server_address'),
    port: await CustomEnv.get<int>(key: 'server_port'),
  );
}
