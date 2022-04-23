import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/noticia_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class NoticiasApi extends Api {
  final GenericService<NoticiaModel> _service;
  NoticiasApi(this._service);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    Router router = Router();

    router.get('/noticias', (Request req) async {
      List<NoticiaModel> noticias = await _service.findAll();
      List<Map> noticiasMap = noticias.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(noticiasMap));
    });

    router.post('/noticias', (Request req) async {
      var body = await req.readAsString();
      var result = await _service.save(
        NoticiaModel.fromRequest(jsonDecode(body)),
      );
      return result ? Response(201) : Response(500);
    });

    // /blog/noticias?id=1 // update
    router.put('/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      // _service.save('');

      return Response.ok('Choveu hoje');
    });

    // /blog/noticias?id=1 // delete
    router.delete('/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      // _service.delete(1);
      return Response.ok('Choveu hoje');
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
