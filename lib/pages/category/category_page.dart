import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/category/left_category_nav.dart';
import 'package:flutter_shop/pages/category/right_category_nav.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/configs/service_url.dart';
import 'dart:convert';

class CategoryPage extends StatefulWidget {
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'), elevation: 0.0),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LeftCategoryNav(),
            SingleChildScrollView(child: RightCategoryNav()),
          ],
        ),
      ),
    );
  }
}

class CategoryGoodsList extends StatefulWidget {
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getGoodList();
  }

  void _getGoodList() async {
    var data = {'categoryId': '4', 'categorySubId': "", 'page': 1};
    await request(servicePath['getMallGoods'], formData: data).then((result) {
      var data = json.decode(result.toString());
      print('-------------------接口数据--------------------');
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
