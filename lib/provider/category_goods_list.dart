import 'package:flutter/material.dart';

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

  void getGoodsList(
      list, categoryId, categorySubId, page) {
    _goodsList = list ?? [];
    _categoryId = categoryId ?? '';
    _categorySubId = categorySubId ?? '';
    _page = page;
    notifyListeners();
  }

  void setGoodsListCategoryId(categoryId) {
    _categoryId = categoryId;
    notifyListeners();
  }

  void setGoodsListCategorySubId(categorySubId) {
    _categorySubId = categorySubId;
    notifyListeners();
  }

  void setGoodsListPage(page) {
    _page = page;
    notifyListeners();
  }

  void setGoodsListIsLoading(isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setGoodsListPageStatus(pageStatus) {
    _pageStatus = pageStatus;
    notifyListeners();
  }
}
