import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/index_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => new _ConfigState();
}

class _ConfigState extends State<Config> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
    ScreenUtil(width: 750, height: 1334, allowFontScaling: false)
      ..init(context);
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: IndexPage(),
      title: new Text('Welcome In SplashScreen'),
      backgroundColor: Colors.blue,
    );
  }
}
