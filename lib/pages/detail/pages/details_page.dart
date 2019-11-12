import 'package:flutter/material.dart';
import 'package:flutter_shop/widget/loaders/loader.dart';
import 'details_top_area.dart';
import 'details_explain.dart';
import 'details_tabBar.dart';
import 'details_web.dart';
import 'details_bottom.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widget/index.dart' show WhiteSpace;

class DetailsPage extends StatefulWidget {
  _DetailsPageState createState() => _DetailsPageState();
  final dynamic goodsId;

  DetailsPage({Key key, this.goodsId}) : super(key: key);
}

class _DetailsPageState extends State<DetailsPage> {
  String pageStatus = 'loading';

  @override
  void initState() {
    super.initState();
//    Provider.of<DetailsInfoProvider>(context)
//        .setDetailInfoPageStatus('loading');
    // 等待页面build完成后再请求数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailsInfoProvider>(context).setGoodsInfo(widget.goodsId);
    });
  }

//  @override
//  void dispose() {
//    super.dispose();
//    Provider.of<DetailsInfoProvider>(context)
//        .setDetailInfoPageStatus('loading');
//  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsInfoProvider>(builder: (context, data, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text('商品详情页'),
          ),
          body: data.pageStatus == 'success'
              ? Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            DetailsTopArea(),
                            DetailsExplain(),
                            DetailsTabBar(),
                            DetailsWeb(),
                            WhiteSpace(height: ScreenUtil().setHeight(80.0))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: DetailsBottom(),
                    ),
                  ],
                )
              : ColorLoader());
    });
  }
}
