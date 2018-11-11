import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// 引入handler
import './RoutesHandler.dart';

class Routes {
  static String splash = "/";
  static String home = "/home";
  static String cart = "/cart";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("路由不存在！");
    });
    router.define(splash, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(cart, handler: cartHandler);
  }
}
