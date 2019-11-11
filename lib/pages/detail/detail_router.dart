import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/router_init.dart';
import 'pages/details_page.dart';

class DetailRouter implements InitRouterProvider {
  static const detailsPage = '/DetailsPage';

  @override
  void initRouter(Router router) {
    router.define(detailsPage, handler: Handler(handlerFunc: (_, params) {
      return DetailsPage(goodsId: params['goodsId'][0]);
    }));
  }
}
