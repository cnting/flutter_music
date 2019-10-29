import 'package:fluro/fluro.dart';
import 'package:flutter_music/config/repository/shared_preference.dart';
import 'package:flutter_music/config/router/routes.dart';

import 'repository/net_repository.dart';

init() {
  Router router = Router();
  Routes.configureRoutes(router);
  App.router = router;

  NetRepository netRepository = NetRepository();
  App.netRepository = netRepository;

  Sp sp = Sp()..init();
  App.sp = sp;
}

class App {
  static Router router;
  static NetRepository netRepository;
  static Sp sp;
}
