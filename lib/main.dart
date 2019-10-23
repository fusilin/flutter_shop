import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/index.dart';
import 'package:flutter_shop/config.dart';
import './provider/counter_model.dart';
import 'package:provider/provider.dart';

void main() {
  final counter = CounterModel();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: counter),
    ],
    child: MyApp(),
  ));
//  runApp(Provider<dynamic>.value(
//    child: ChangeNotifierProvider.value(
//      value: counter,
//      child: MyApp(),
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
        home: Config(),
      ),
    );
  }
}
