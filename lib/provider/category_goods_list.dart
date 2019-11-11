import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';
import 'package:flutter_shop/model/categoryGoodsList.dart';
import 'package:provider/provider.dart';

class CategoryGoodsListProvider with ChangeNotifier {
  List _goodsList = [];
  var _categoryId = '4';
  var _categorySubId;
  int _page = 1;
  bool _isLoading = false;
  String _pageStatus = 'loading';

  get goodsList => _goodsList;

  get categoryId => _categoryId;

  get categorySubId => _categorySubId;

  get page => _page;

  get isLoading => _isLoading;

  get pageStatus => _pageStatus;

  void setCategoryGoodsList(list, categoryId, categorySubId, page) {
    _goodsList = list ?? [];
    _categoryId = categoryId ?? '';
    _categorySubId = categorySubId ?? '';
    _page = page;
    notifyListeners();
  }

  void setCategoryGoods(
      {pageStatus, isLoading, categoryId, categorySubId, page}) {
    _pageStatus = pageStatus ?? _pageStatus;
    _isLoading = isLoading ?? _isLoading;
    _categoryId = categoryId ?? _categoryId;
    _categorySubId = categorySubId ?? _categorySubId;
    _page = page ?? _page;
    notifyListeners();
  }

  void getGoodList(context, categoryId) async {
    var _provider = Provider.of<CategoryGoodsListProvider>(context);
    _provider.setCategoryGoods(pageStatus: 'loading');
    var _categoryId = categoryId ?? _provider.categoryId;
    var _categorySubId = '';
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
        _provider.setCategoryGoodsList(
            goodsList.data, _categoryId, _categorySubId, 1);
        _provider.setCategoryGoods(pageStatus: 'success', isLoading: false);
      } else {
        _provider.setCategoryGoods(pageStatus: 'error', isLoading: false);
      }
    });
  }
}
