import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:flutter_shop/constant/color_constant.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<String> _pList = ['assets/p1.jpg', 'assets/p2.jpg', 'assets/p3.jpg'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pList.forEach((image) {
        precacheImage(AssetImage(image), context);
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                onPressed: () => NavigatorUtils.push(context, Routes.indexPage,
                    replace: true),
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
    return Material(
      child: Swiper(
          itemCount: 3,
          itemBuilder: (context, index) {
            return _imageItem(index);
          },
          loop: false,
          autoplay: false),
    );
  }
}
