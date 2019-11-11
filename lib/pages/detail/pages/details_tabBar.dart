//import 'package:flutter/material.dart';
//
//class DetailsTabBar extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Theme(
//      data: Theme.of(context).copyWith(
//          buttonTheme: ButtonThemeData(
//              padding: const EdgeInsets.symmetric(horizontal: 16.0),
//              minWidth: 64.0,
//              height: 30.0,
//              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(4.0),
//              )),
//          textTheme: TextTheme(
//              button: TextStyle(
//            fontSize: 14.0,
//          ))),
//      child: Row(
//        children: <Widget>[
//          FlatButton(
//            color: Color(0xFFF6F6F6),
//            onPressed: () {},
//            child: Text("联系客户"),
//          ),
//          FlatButton(
//            color: Color(0xFFF6F6F6),
//            onPressed: () {},
//            child: Text("拒单"),
//          )
//        ],
//      ),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/details_info.dart';

class DetailsTabBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<DetailsInfoProvider>(
      builder: (context, data, _) {
        var isLeft = data.isLeft;
        var isRight = data.isRight;

        return Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _myTabBarLeft(context, isLeft),
                  _myTabBarRight(context, isRight)
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _myTabBarLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provider.of<DetailsInfoProvider>(context).changeLeftAndRight('left');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.0, color: isLeft ? Colors.pink : Colors.black12))),
        child: Text(
          '详细',
          style: TextStyle(color: isLeft ? Colors.pink : Colors.black),
        ),
      ),
    );
  }

  Widget _myTabBarRight(BuildContext context, bool isRight) {
    return InkWell(
      onTap: () {
        Provider.of<DetailsInfoProvider>(context).changeLeftAndRight('right');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: isRight ? Colors.pink : Colors.black12))),
        child: Text(
          '评论',
          style: TextStyle(color: isRight ? Colors.pink : Colors.black),
        ),
      ),
    );
  }
}
