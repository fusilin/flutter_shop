import 'package:flutter/material.dart';

class ChildCategory with ChangeNotifier {
  List _childCategoryList = [];

  get childCategoryList => _childCategoryList;

  void getChildCategory(list) {
    print(998888888);
    print(list);
    _childCategoryList = list;
    notifyListeners();
  }
}