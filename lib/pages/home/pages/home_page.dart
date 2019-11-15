import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/widget/index.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'ad_banner.dart';
import 'leader_phone.dart';
import 'recommend.dart';
import 'floor_title.dart';
import 'floor_content.dart';
import 'hot_goods.dart';
import 'package:flutter_shop/widget/loaders/loader.dart';
import 'package:flutter_shop/pages/helper/refresh_helper.dart';

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  EasyRefreshController easyRefreshController = EasyRefreshController();
  String homePageContent = '正在获取数据';
  String pageStatus = 'loading';
  int page = 1;
  List<Map> hotGoodsList = [];
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _getHotGoods();
  }

  _getHotGoods() {
    if (isLoading) {
      return null;
    }
    setState(() {
      isLoading = true;
    });
    var formPage = {'page': page};
    getHomePageBeloContent(formPage).then((result) {
      var data = json.decode(result.toString());
      if (result.statusCode == 200) {
        List<Map> newGoodsList = (data['data'] as List).cast();
        setState(() {
          hotGoodsList.addAll(newGoodsList);
          isLoading = false;
          pageStatus = 'success';
          page++;
        });
        easyRefreshController.finishLoad(
            success: true, noMore: newGoodsList.length == 0);
      } else {
        setState(() {
          pageStatus = 'error';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot) {
          if (pageStatus == 'error') {
            return Center(child: Text('服务器异常，请稍后再试'));
          } else if (pageStatus == 'success' && snapshot.hasData) {
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
            List<Map> recommendList =
                (data['data']['recommend'] as List).cast();

            String floor1Title =
                data['data']['floor1Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
            String floor2Title =
                data['data']['floor2Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
            String floor3Title =
                data['data']['floor3Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
            List<Map> floor1 =
                (data['data']['floor1'] as List).cast(); //楼层1商品和图片
            List<Map> floor2 =
                (data['data']['floor2'] as List).cast(); //楼层1商品和图片
            List<Map> floor3 =
                (data['data']['floor3'] as List).cast(); //楼层1商品和图片

            return EasyRefresh(
              footer: RefreshHelper.footer,
              enableControlFinishLoad: true,
              controller: easyRefreshController,
              child: ListView(
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
                  Recommend(recommendList: recommendList),
                  FloorTitle(pictureAddress: floor1Title),
                  FloorContent(floorGoodsList: floor1),
                  FloorTitle(pictureAddress: floor2Title),
                  FloorContent(floorGoodsList: floor2),
                  FloorTitle(pictureAddress: floor3Title),
                  FloorContent(floorGoodsList: floor3),
                  HotGoods(hotGoodsList: hotGoodsList),
                ],
              ),
              onLoad: () async {
                _getHotGoods();
              },
            );
          } else {
            return ColorLoader();
          }
        },
      ),
    );
  }
}
