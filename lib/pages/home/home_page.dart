import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/widget/index.dart';
import './ad_banner.dart';
import './leader_phone.dart';
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
            List<Map> navigatorList = (data['data']['category'] as List).cast();
            if (navigatorList.length > 10) {
              navigatorList.removeRange(10, navigatorList.length);
            }

            String advertesPicture =
            data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片

            String leaderImage = data['data']['shopInfo']['leaderImage']; //店长图片
            String leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SwiperDiy(
                    swiperDataList: swiper,
                  ),
                  GirdView(
                    navigatorList: navigatorList,
                  ),
                  AdBanner(advertesPicture: advertesPicture), //广告组件
                  LeaderPhone(
                      leaderImage: leaderImage, leaderPhone: leaderPhone),
                ],
              ),
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
