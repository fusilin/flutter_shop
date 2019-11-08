import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/counter_model.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:flutter_shop/provider/category_goods_list.dart';

void main() {
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;
  final counter = CounterModel();
  final childCategory = ChildCategory();
  final categoryGoodsList = CategoryGoodsListProvider();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: counter),
      ChangeNotifierProvider.value(value: childCategory),
      ChangeNotifierProvider.value(value: categoryGoodsList),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      dismissOtherOnShow: true,
      child: MaterialApp(
        title: '百姓生活家app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: ColorConstant.theme),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
