import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/config/router/route_handler.dart';
import 'package:flutter_music/ui/page/home/home_page.dart';
import 'package:flutter_music/ui/page/login_page.dart';
import 'package:flutter_music/ui/page/mine/mine_page.dart';
import 'package:flutter_music/ui/page/splash_page.dart';

import 'route_handler.dart';

class Routes {
  static String root = "/";

  ///首页
  static const String home = "/home";

  ///首页-我的
  static const String homeMine = "/home/mine";

  ///首页-发现
  static const String homeDiscovery = "/home/discovery";

  ///首页-云村
  static const String homeVillage = "/home/village";

  ///首页-视频
  static const String homeVideo = "/home/video";

  ///登录
  static const String login = "/login";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      debugPrint('===>页面找不到');
      return Container();
    });
    router.define(root, handler: commonHandler(SplashPage()));
    router.define(home, handler: commonHandler(HomePage()));
    router.define(homeMine, handler: commonHandler(MinePage()));
    router.define(login, handler: commonHandler(LoginPage()));
  }
}
