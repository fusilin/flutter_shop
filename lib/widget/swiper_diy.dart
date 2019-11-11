import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/pages/detail/detail_router.dart';

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(333),
        child: Swiper(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  return NavigatorUtils.push(
                      context,
                      DetailRouter.detailsPage +
                          '?goodsId=${swiperDataList[index]['goodsId']}');
//                  return Scaffold.of(context).showSnackBar(SnackBar(
//                    content: Text('轮播图${index + 1}'),
//                    backgroundColor: Color(0xff5B973C),
//                    shape: ShapeBorder.lerp(
//                        null,
////                          Border(top: BorderSide(color: Colors.red, width: 2)),
//                        Border(
//                            bottom: BorderSide(color: Colors.black, width: 2)),
//                        2),
//                    action: SnackBarAction(
//                      label: 'test',
//                      onPressed: () {},
//                    ),
//                  ));
                },
                child: Image.network('${swiperDataList[index]['image']}',
                    fit: BoxFit.cover));
          },
          autoplay: true,
          pagination: SwiperPagination(),
        ));
  }
}
