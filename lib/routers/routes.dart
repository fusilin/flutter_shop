import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_shop/config/route_handlers.dart';
import 'package:flutter_shop/config.dart';
import 'package:flutter_shop/pages/category/next_category.dart';
import 'package:flutter_shop/pages/member_page.dart';

class Routes {
  static Router router;

  /// 只是唯一的key值，不是路径
  static String root = '/';
  static String nextCategory = '/pages/category/next_category';

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

    Routes.router = router;
  }
}
