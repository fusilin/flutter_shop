import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;

  get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
