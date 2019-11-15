import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:flutter_shop/constant/color_constant.dart';
import 'package:flutter_shop/widget/index.dart' show CustomSwiperPagination;
import 'package:shared_preferences/shared_preferences.dart';
import 'index_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
  final bool isFirstStart;

  SplashPage({Key key, this.isFirstStart}) : super(key: key);
}

class _SplashPageState extends State<SplashPage> {
  List<String> _pList = ['assets/p1.jpg', 'assets/p2.jpg', 'assets/p3.jpg'];
  SwiperController _controller = SwiperController();
  ScrollPhysics _physics = ScrollPhysics();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pList.forEach((image) {
        precacheImage(AssetImage(image), context);
      });
    });
  }

  Widget _imageItem(index) {
    var _item = Image.asset(
      _pList[index],
      key: Key(_pList[index]),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
    if (index == 2) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _item,
          Positioned(
              child: RaisedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('isFirstStart', 'isFirstStart');
                  NavigatorUtils.push(context, Routes.indexPage, replace: true);
                },
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                color: ColorConstant.theme,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Enter Joker\'s world',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(34),
                  ),
                ),
              ),
              bottom: 80)
        ],
      );
    } else {
      return _item;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: false)
          ..init(context);
    return widget.isFirstStart
        ? Material(
            child: Swiper(
              itemCount: 3,
              itemBuilder: (context, index) {
                return _imageItem(index);
              },
              controller: _controller,
              physics: _physics,
              loop: false,
              autoplay: false,
              pagination: CustomSwiperPagination(),
            ),
          )
        : IndexPage();
  }
}
