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

    router.get('/noticia', (Request req) async {
      String? id = req.url.queryParameters['id'];
      if (id == null) return Response(400);

      var noticia = await _service.findOne(int.parse(id));
      if (noticia == null) return Response(400);

      return Response.ok(jsonEncode(noticia.toJson()));
    });

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

    router.put('/noticias', (Request req) async {
      var body = await req.readAsString();
      var result = await _service.save(
        NoticiaModel.fromRequest(jsonDecode(body)),
      );
      return result ? Response(200) : Response(500);
    });

    router.delete('/noticias', (Request req) async {
      String? id = req.url.queryParameters['id'];
      if (id == null) return Response(400);

      var result = await _service.delete(int.parse(id));
      return result ? Response(200) : Response.internalServerError();
    });

    return createHandler(
      router: router,
      isSecurity: isSecurity,
      middlewares: middlewares,
    );
  }
}
