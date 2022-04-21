import '../../apis/blog_api.dart';
import '../../apis/login_api.dart';
import '../../models/noticia_model.dart';
import '../../services/generic_service.dart';
import '../../services/noticia_service.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<SecurityService>(() => SecurityServiceImp());

    di.register<LoginApi>(() => LoginApi(di<SecurityService>()));

    di.register<GenericService<NoticiaModel>>(() => NoticiaService());
    di.register<BlogApi>(() => BlogApi(di<GenericService<NoticiaModel>>()));

    return di;
  }
}
