import 'package:flutter/material.dart';

class ChildCategory with ChangeNotifier {
  List _childCategoryList = [];

  get childCategoryList => _childCategoryList;

  void getChildCategory(list) {
    Map<String, dynamic> all = {};
    all['mallSubId'] = '00';
    all['mallCategoryId'] = '00';
    all['mallSubName'] = '全部';
    all['comments'] = 'null';
    _childCategoryList = [all];
    _childCategoryList.addAll(list);
    notifyListeners();
  }
}
