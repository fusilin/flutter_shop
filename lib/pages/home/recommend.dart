import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/constant/index.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommendList()],
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12),
          )),
      child: Text(
        '商品推荐',
        style: TextStyle(color: ColorConstant.theme),
      ),
    );
  }

  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }

  Widget _item(index) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: '待完善', toastLength: Toast.LENGTH_SHORT);
      },
      child: Container(
        width: ScreenUtil().setWidth(250),
        height: ScreenUtil().setHeight(330),
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border(right: BorderSide(width: 1, color: Colors.black12)),
        ),
        child: Column(
          children: <Widget>[
            Image.network(
              recommendList[index]['image'],
              fit: BoxFit.cover,
              height: ScreenUtil().setHeight(250),
              width: ScreenUtil().setWidth(250),
            ),
            Text(
              '￥${recommendList[index]['mallPrice']}',
            ),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
