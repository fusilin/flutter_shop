import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/category/category.dart';

class ChildCategory with ChangeNotifier {
  List childCategoryList = [];

  getChildCategory(List list) {
    childCategoryList = list;
    notifyListeners();
  }
}
