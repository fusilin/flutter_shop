import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomSwiperPagination extends SwiperPlugin {
  /// 属性暂时写si,可以设置传值
  final double activeHeight = 20.0;
  final double activeWidth = 30.0;
  final double height = 10.0;
  final double width = 15.0;
  final double bottom = 40.0;
  final double space = 5.0;

  final Key key = Key('CustomSwiperPagination');

  final List<String> imageList = [
    'assets/swiper1.jpg',
    'assets/swiper2.jpg',
    'assets/swiper3.jpg'
  ];

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    List<Widget> list = [];
    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;
    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(Container(
        key: Key("pagination_$i"),
        margin: EdgeInsets.all(space),

        /// 随便自定义
        child: Image.asset(
          imageList[i] ?? imageList[0],
          height: active ? activeHeight : height,
          width: active ? activeWidth : width,
          fit: BoxFit.cover,
//            color: ColorConstant.theme,
        ),
      ));
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(
            bottom: bottom,
            child: Row(
              key: key,
              mainAxisSize: MainAxisSize.min,
              children: list,
            ))
      ],
    );
  }
}
