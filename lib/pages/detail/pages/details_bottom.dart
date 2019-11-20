import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/details_info.dart';
import 'package:flutter_shop/provider/cart.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/pages/cart/cart_router.dart';

class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsInfoProvider>(builder: (context, data, _) {
      var goodsInfo = data.goodsInfo.data.goodInfo;
      var goodsId = goodsInfo.goodsId;
      var goodsName = goodsInfo.goodsName;
      var count = 1;
      var price = goodsInfo.presentPrice;
      var images = goodsInfo.image1;

      return Container(
        width: ScreenUtil().setWidth(750),
        color: Colors.white,
        height: ScreenUtil().setHeight(80),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                NavigatorUtils.push(context, CartRouter.cartPage);
              },
              child: Container(
                width: ScreenUtil().setWidth(110),
                alignment: Alignment.center,
                child: Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                          height: ScreenUtil().setHeight(1334) * 0.65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(24.0),
                                vertical: ScreenUtil().setWidth(40.0)),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Column(
                                children: <Widget>[
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                  Text('test'),
                                ],
                              ),
                            ),
                          ));
                    });
//
//                Provider.of<CartProvider>(context)
//                    .save(goodsId, goodsName, count, price, images);
//                showToast(
//                  '加入成功',
//                  duration: Duration(seconds: 2),
//                  backgroundColor: Colors.black.withOpacity(0.5),
//                  position: ToastPosition.bottom,
//                  radius: 12.0,
//                );
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(80),
                color: Colors.green,
                child: Text(
                  '加入购物车',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(80),
                color: Colors.red,
                child: Text(
                  '马上购买',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
