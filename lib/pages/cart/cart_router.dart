import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/router_init.dart';

import 'pages/next_cart.dart';

class CartRouter implements InitRouterProvider {
  static String nextCart = '/nextCart';

  @override
  void initRouter(Router router) {
    router.define(nextCart,
        handler: Handler(handlerFunc: (_, params) => NextCart()));
  }
}
