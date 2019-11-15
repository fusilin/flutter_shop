import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhiteSpace extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;

  WhiteSpace({Key key, this.height, this.width, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? ScreenUtil().setHeight(20.0),
      width: width ?? ScreenUtil().setWidth(750.0),
      color: backgroundColor ?? Colors.transparent,
      child: null,
    );
  }
}
