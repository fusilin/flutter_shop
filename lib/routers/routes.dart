import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_shop/config.dart';
import 'package:flutter_shop/pages/member/next_category.dart';
import 'package:flutter_shop/pages/cart/next_cart.dart';

class Routes {
  static Router router;

  /// 只是唯一的key值，不是路径
  static String root = '/';
  static String nextCategory = '/pages/category/next_category';
  static String nextCart = '/pages/cart/next_cart';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root,
        handler: Handler(handlerFunc: (context, params) => Config()));
    router.define(nextCategory,
        handler: Handler(handlerFunc: (context, params) {
      var todo = params['todo'];
      return NextCategory(todo: todo);
    }));
    router.define(nextCart, handler: Handler(handlerFunc: (context, params) {
      return NextCart();
    }));

    Routes.router = router;
  }
}
