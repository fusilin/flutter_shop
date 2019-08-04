import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            return Image.network('${swiperDataList[index]['image']}',
                fit: BoxFit.cover);
          },
          autoplay: true,
          pagination: SwiperPagination(),
        ));
  }
}
