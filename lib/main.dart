import 'package:flutter/material.dart';
import 'package:flutter_shop/constant/index.dart';
import './pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      child: MaterialApp(
        title: '百姓生活家app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorConstant.theme
        ),
        home: IndexPage(),
      ),
    );
  }
}