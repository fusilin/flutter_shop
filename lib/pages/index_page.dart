import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/constant/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './home_page.dart';
import './category_page.dart';
import './cart_page.dart';
import './member_page.dart';

const double _TabTextSize = 22.0;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => new _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final tabTextStyleNormal =
      new TextStyle(color: ColorConstant.textLight, fontSize: _TabTextSize);

  final tabTextStyleSelected = new TextStyle(
      color: ColorConstant.theme,
//      fontSize: ScreenUtil().setSp(_TabTextSize),
      fontWeight: FontWeight.w600);
  int _currentIndex = 0;

  @override
  void initState() {
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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
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
