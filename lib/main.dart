import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_shop/configs/appUIStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_shop/constant/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/counter_model.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:flutter_shop/provider/category_goods_list.dart';
import 'package:flutter_shop/provider/details_info.dart';
import 'package:flutter_shop/provider/cart.dart';
//import 'package:fluwx/fluwx.dart' as fluwx;
import 'splash_page.dart';

void main() async {
  AppUIStyle.appUIStyle();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirstStart = prefs.getString('isFirstStart') != 'isFirstStart';
  final bool isLogin = prefs.getString('isLogin') != 'isLogin';
//  fluwx.registerWxApi(appId: 'wxb12d51579ba8aad0');
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;
  final counter = CounterModel();
  final childCategory = ChildCategory();
  final categoryGoodsList = CategoryGoodsListProvider();
  final detailsInfo = DetailsInfoProvider();
  final cartProvider = CartProvider();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: counter),
      ChangeNotifierProvider.value(value: childCategory),
      ChangeNotifierProvider.value(value: categoryGoodsList),
      ChangeNotifierProvider.value(value: detailsInfo),
      ChangeNotifierProvider.value(value: cartProvider),
    ],
    child: MyApp(isFirstStart: isFirstStart, isLogin: isLogin),
  ));
}

class MyApp extends StatelessWidget {
  final bool isFirstStart;
  final bool isLogin;

  MyApp({Key key, this.isFirstStart, this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      dismissOtherOnShow: true,
      child: MaterialApp(
        title: 'Joker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: ColorConstant.theme),
        home: SplashPage(isFirstStart: isFirstStart, isLogin: isLogin),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
