import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import '../home_router.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/pages/detail/detail_router.dart';

class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_firstRow(context), _otherGoods(context)],
      ),
    );
  }

  Widget _firstRow(context) {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0], context),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1], context),
            _goodsItem(floorGoodsList[2], context),
          ],
        )
      ],
    );
  }

  Widget _otherGoods(context) {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3], context),
        _goodsItem(floorGoodsList[4], context),
      ],
    );
  }

  Widget _goodsItem(Map goods, context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          return NavigatorUtils.push(context,
              DetailRouter.detailsPage + '?goodsId=${goods['goodsId']}');
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}
