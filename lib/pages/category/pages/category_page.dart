import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/category/pages/left_category_nav.dart';
import 'package:flutter_shop/pages/category/pages/right_category_nav.dart';
import 'package:flutter_shop/pages/category/pages/category_goods_list.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';
import 'package:flutter_shop/model/categoryGoodsList.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/category_goods_list.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:flutter_shop/pages/member/category.dart';
import 'package:flutter_shop/widget/loaders/loader.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  String pageStatus = 'loading';
  List list = [];

  @override
  initState() {
    super.initState();
    _getCategory();
  }

  _getCategory() async {
    await request('getCategory').then((result) {
      var data = json.decode(result.toString());
      if (result.statusCode == 200) {
        CategoryBigListModel category =
            CategoryBigListModel.formJson(data['data']);

        Provider.of<ChildCategory>(context)
            .getChildCategory(category.data[0].bxMallSubDto);
        _getGoodList(categoryId: category.data[0].mallCategoryId);
        setState(() {
          list = category.data;
          pageStatus = 'success';
        });
      } else {
        setState(() {
          pageStatus = 'error';
        });
      }
    });
  }

  _getGoodList({String categoryId}) async {
    var categoryGoodsListProvider =
        Provider.of<CategoryGoodsListProvider>(context);
    var _categoryId = categoryId ?? categoryGoodsListProvider.categoryId;
    var _categorySubId = categoryGoodsListProvider.categorySubId;
    var params = {
      'categoryId': _categoryId,
      'categorySubId': _categorySubId,
      'page': 1
    };
    await request('getMallGoods', formData: params).then((result) {
      var data = json.decode(result.toString());
      if (result.statusCode == 200) {
        CategoryGoodsListModel goodsList =
            CategoryGoodsListModel.fromJson(data);
        categoryGoodsListProvider.setCategoryGoodsList(
            goodsList.data, _categoryId, _categorySubId, 1);
        categoryGoodsListProvider.setCategoryGoods(pageStatus: 'success');
      } else {
        categoryGoodsListProvider.setCategoryGoods(pageStatus: 'error');
      }
      categoryGoodsListProvider.setCategoryGoods(isLoading: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'), elevation: 0.0),
      body: Container(
        child: pageStatus == 'loading'
            ? ColorLoader()
            : Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(child: LeftCategoryNav(list: list), flex: 1),
                  Expanded(
                      flex: 3,
                      child: Container(
                        child: Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            RightCategoryNav(),
                            Expanded(
                              child: CategoryGoodsList(),
                            )
                          ],
                        ),
                      )),
                ],
              ),
      ),
    );
  }
}
