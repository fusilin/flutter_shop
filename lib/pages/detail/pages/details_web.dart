import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/details_info.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsInfoProvider>(builder: (context, data, _) {
      return data.isLeft
          ? Container(
              child: Html(data: data.goodsInfo.data.goodInfo.goodsDetail),
            )
          : Container(
              height: 400,
              margin: EdgeInsets.only(top: 30),
              child: Text('暂无数据'),
            );
    });
  }
}
