import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/index.dart';
import 'package:flutter_shop/provider/counter_model.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/routes.dart';

void main() {
  final router = new Router();
  Routes.configureRoutes(router);
  final counter = CounterModel();
  final childCategory = ChildCategory();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: counter),
      ChangeNotifierProvider.value(value: childCategory),
    ],
    child: MyApp(),
  ));
//  runApp(Provider<dynamic>.value(
//    child: ChangeNotifierProvider.value(
////      value: counter,
////      child: MyApp(),
//    ),
//  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活家app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: ColorConstant.theme),
//        home: Config(),
        onGenerateRoute: Routes.router.generator,
      ),
    );
  }
}
