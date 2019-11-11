import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(10.0),
      child: Text(
        '说明',
        style: TextStyle(color: Colors.red, fontSize: ScreenUtil().setSp(30.0)),
      ),
    );
  }
}
