import 'package:fluro/fluro.dart';
import 'package:flutter_music/config/router/routes.dart';

init() {
  ///配置Router
  Router router = Router();
  Routes.configureRoutes(router);
  App.router = router;
}

class App {
  static Router router;
}
