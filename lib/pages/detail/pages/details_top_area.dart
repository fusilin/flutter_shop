import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/details_info.dart';
import 'package:flutter_shop/widget/loaders/loader.dart';
import 'package:flutter_shop/constant/color_constant.dart';

class DetailsTopArea extends StatelessWidget {
  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30.0),
        ),
      ),
    );
  }

  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号：${num}',
        maxLines: 1,
        style: TextStyle(
          color: Colors.black26,
          fontSize: ScreenUtil().setSp(26.0),
        ),
      ),
    );
  }

  //商品价格方法

  Widget _goodsPrice(presentPrice, oriPrice) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            '￥${presentPrice}',
            style: TextStyle(
              color: ColorConstant.theme,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          Text(
            '市场价:￥${oriPrice}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DetailsInfoProvider>(builder: (context, data, _) {
      var goodsInfo = data.goodsInfo.data.goodInfo;
      if (goodsInfo != null) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              _goodsImage(goodsInfo.image1),
              _goodsName(goodsInfo.goodsName),
              _goodsNum(goodsInfo.goodsSerialNumber),
              _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice),
            ],
          ),
        );
      } else {
        return ColorLoader();
      }
    });
  }
}
