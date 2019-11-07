import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/router_init.dart';
import 'pages/next_home.dart';

class HomeRouter implements InitRouterProvider {
  static String nextHome = '/nextHome';

  @override
  void initRouter(Router router) {
    router.define(nextHome,
        handler: Handler(handlerFunc: (context, params) => NextHome()));
  }
}
