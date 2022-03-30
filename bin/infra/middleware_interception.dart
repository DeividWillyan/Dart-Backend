import 'package:shelf/shelf.dart';

class MiddlewareInterception {
  Middleware get middlerware => createMiddleware(
        responseHandler: (Response res) => res.change(
          headers: {
            'content-type': 'application/json',
            'xpto': '123',
          },
        ),
      );
}
