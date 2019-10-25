import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_shop/constant/index.dart';
import 'package:flutter_shop/pages/home/home_page.dart';
import 'package:flutter_shop/pages/category/category_page.dart';
import 'package:flutter_shop/pages/cart/cart_page.dart';
import 'package:flutter_shop/pages/member/member_page.dart';
import 'package:flutter/services.dart';

final double _tabTextSize = ScreenUtil.getInstance().setSp(22.0);

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => new _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final tabTextStyleNormal =
      new TextStyle(color: ColorConstant.textLight, fontSize: _tabTextSize);
  final tabTextStyleSelected = new TextStyle(
      color: ColorConstant.theme,
      fontSize: _tabTextSize,
      fontWeight: FontWeight.w600);
  int _currentIndex = 0;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarIconBrightness: Brightness.light));
    super.initState();
  }

  Text getBottomNavigationTitle(int currentIndex) {
    return new Text(
      TextConstant.bottomTitles[currentIndex],
      style: currentIndex == _currentIndex
          ? tabTextStyleSelected
          : tabTextStyleNormal,
    );
  }

  List<BottomNavigationBarItem> bottomNavigationBar() {
    List<BottomNavigationBarItem> _itemBar = [];
    for (int i = 0; i < TextConstant.bottomTabs.length; i++) {
      _itemBar.add(new BottomNavigationBarItem(
          icon: TextConstant.bottomTabs[i],
          activeIcon: TextConstant.bottomTabs[i],
          title: getBottomNavigationTitle(i)));
    }
    return _itemBar;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new IndexedStack(
          children: <Widget>[
            new HomePage(),
            new CategoryPage(),
            new CartPage(),
            new MemberPage()
          ],
          index: _currentIndex,
        ),
        bottomNavigationBar: new CupertinoTabBar(
          backgroundColor: Colors.white,
          items: bottomNavigationBar(),
          currentIndex: _currentIndex,
          activeColor: ColorConstant.theme,
          inactiveColor: CupertinoColors.inactiveGray,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
