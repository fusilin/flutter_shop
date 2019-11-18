import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/router_init.dart';
import 'pages/animation_page.dart';

class AnimationRouter implements InitRouterProvider {
  static String animationPage = '/animationPage';

  @override
  void initRouter(Router router) {
    router.define(animationPage, handler: Handler(handlerFunc: (_, params) {
      return AnimationPage();
    }));
  }
}
