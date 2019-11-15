import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/router_init.dart';

import 'cartPage/next_cart.dart';
import 'cartPage/cart_page.dart';
import 'cartPage/jg_push.dart';

class CartRouter implements InitRouterProvider {
  static String cartPage = '/cartPage';
  static String nextCart = '/nextCart';
  static String jsPush = '/jsPush';

  @override
  void initRouter(Router router) {
    router.define(cartPage,
        handler: Handler(handlerFunc: (_, params) => CartPage()));
    router.define(nextCart,
        handler: Handler(handlerFunc: (_, params) => NextCart()));
    router.define(jsPush,
        handler: Handler(handlerFunc: (_, params) => JgPush()));
  }
}
