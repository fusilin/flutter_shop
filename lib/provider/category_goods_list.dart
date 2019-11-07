import 'package:flutter/material.dart';

class CategoryGoodsListProvider with ChangeNotifier {
  List _goodsList = [];
  var _categoryId;
  int _page = 1;
  bool _isLoading = false;
  String _pageStatus = 'loading';

  get goodsList => _goodsList;

  get categoryId => _categoryId;

  get page => _page;

  get isLoading => _isLoading;

  get pageStatus => _pageStatus;

  void getGoodsList(list, categoryId, page, isLoading, pageStatus) {
    _goodsList = list;
    _categoryId = categoryId;
    _page = page;
    _isLoading = isLoading;
    _pageStatus = pageStatus;
    notifyListeners();
  }

  void setGoodsListCategoryId(categoryId) {
    _categoryId = categoryId;
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
