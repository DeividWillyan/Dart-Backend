import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';

class BlogApi {
  final GenericService _service;
  BlogApi(this._service);

  Handler get handler {
    Router router = Router();

    // listagem
    router.get('/blog/noticias', (Request req) {
      // _service.findAll();
      return Response.ok('Choveu hoje');
    });

    // nova noticias
    router.post('/blog/noticias', (Request req) {
      // _service.save('');
      return Response.ok('Choveu hoje');
    });

    // /blog/noticias?id=1 // update
    router.put('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      // _service.save('');

      return Response.ok('Choveu hoje');
    });

    // /blog/noticias?id=1 // delete
    router.delete('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      // _service.delete(1);
      return Response.ok('Choveu hoje');
    });

    return router;
  }
}
