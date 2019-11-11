import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/404.dart';
import 'package:flutter_shop/routers/router_init.dart';
import 'package:flutter_shop/config.dart';
import 'package:flutter_shop/pages/cart/cart_router.dart';
import 'package:flutter_shop/pages/home/home_router.dart';
import 'package:flutter_shop/pages/category/category_router.dart';
import 'package:flutter_shop/pages/detail/detail_router.dart';

class Routes {
  static List<InitRouterProvider> _listRouter = [];

  /// 只是唯一的key值，不是路径
  static String root = '/';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return PageNotFind();
    });

    router.define(root,
        handler: Handler(handlerFunc: (context, params) => Config()));

    _listRouter.clear();
    _listRouter.add(CartRouter());
    _listRouter.add(HomeRouter());
    _listRouter.add(CategoryRouter());
    _listRouter.add(DetailRouter());

    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
