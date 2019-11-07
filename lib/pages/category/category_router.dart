import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/router_init.dart';
import 'package:flutter_shop/pages/category/pages/next_category.dart';

class CategoryRouter implements InitRouterProvider {
  static String nextCategory = '/nextCategory';

  @override
  void initRouter(Router router) {
    router.define(nextCategory, handler: Handler(handlerFunc: (_, params) {
      var todo = params['todo'];
      return NextCategory(todo: todo);
    }));
  }
}
