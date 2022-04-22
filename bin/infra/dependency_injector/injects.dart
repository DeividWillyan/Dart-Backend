import '../../apis/blog_api.dart';
import '../../apis/login_api.dart';
import '../../apis/user_api.dart';
import '../../dao/usuario_dao.dart';
import '../../models/noticia_model.dart';
import '../../services/generic_service.dart';
import '../../services/login_service.dart';
import '../../services/noticia_service.dart';
import '../../services/user_service.dart';
import '../database/db_configuration.dart';
import '../database/mysql_db_configuration.dart';
import '../security/security_service.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    di.register<SecurityService>(() => SecurityServiceImp());
    di.register<DBConfiguration>(() => MySqlDBConfiguration());

    di.register<UsuarioDAO>(() => UsuarioDAO(di<DBConfiguration>()));
    di.register<UserService>(() => UserService(di<UsuarioDAO>()));
    di.register<UserApi>(() => UserApi(di<UserService>()));

    di.register<LoginService>(() => LoginService(di<UserService>()));
    di.register<LoginApi>(
      () => LoginApi(di<SecurityService>(), di<LoginService>()),
    );

    di.register<GenericService<NoticiaModel>>(() => NoticiaService());
    di.register<BlogApi>(() => BlogApi(di<GenericService<NoticiaModel>>()));

    return di;
  }
}
