import 'package:flutter/material.dart';
import 'dart:core';
import '../service/service_method.dart';
import '../components/swiper_diy.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  void initState() {
    super.initState();
    _getDataAction();
  }

  // 请求数据
  _getDataAction() {
    getHomePageContent().then((result) {
      print('----------------------');
      print(result);
      setState(() {
        homePageContent:
        result.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
//      body: SingleChildScrollView(child: Text(homePageContent)),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (data['data']['slides'] as List).cast();
            return Column(
              children: <Widget>[
                SwiperDiy(
                  swiperDataList: swiper,
                )
              ],
            );
          } else {
            return Center(
              child: Text('数据加载中'),
            );
          }
        },
      ),
    );
  }
}
