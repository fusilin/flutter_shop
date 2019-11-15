import 'package:flutter/material.dart';
import 'package:flutter_shop/configs/appUIStyle.dart';
import 'package:flutter_shop/constant/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/counter_model.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:flutter_shop/provider/category_goods_list.dart';
import 'package:flutter_shop/provider/details_info.dart';
import 'package:flutter_shop/provider/cart.dart';
import 'splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  AppUIStyle.appUIStyle();
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;
  final counter = CounterModel();
  final childCategory = ChildCategory();
  final categoryGoodsList = CategoryGoodsListProvider();
  final detailsInfo = DetailsInfoProvider();
  final cartProvider = CartProvider();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirstStart = prefs.getString('isFirstStart') != 'isFirstStart';
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: counter),
      ChangeNotifierProvider.value(value: childCategory),
      ChangeNotifierProvider.value(value: categoryGoodsList),
      ChangeNotifierProvider.value(value: detailsInfo),
      ChangeNotifierProvider.value(value: cartProvider),
    ],
    child: MyApp(isFirstStart: isFirstStart),
  ));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
  final bool isFirstStart;

  MyApp({Key key, this.isFirstStart}) : super(key: key);
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      dismissOtherOnShow: true,
      child: MaterialApp(
        title: 'Joker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: ColorConstant.theme),
        home: SplashPage(isFirstStart: widget.isFirstStart),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
