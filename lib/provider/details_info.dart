import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/model/details.dart';
import 'dart:convert';

class DetailsInfoProvider with ChangeNotifier {
  var _goodsInfo;
  String _pageStatus = 'loading';
  String _tab = 'left';
  bool _isLeft = true;
  bool _isRight = false;

  get goodsInfo => _goodsInfo;

  get pageStatus => _pageStatus;

  get tab => _tab;

  get isLeft => _isLeft;

  get isRight => _isRight;

  setGoodsInfo(goodsId) async {
    await request('getGoodDetailById', formData: {'goodId': goodsId})
        .then((result) {
      if (result.statusCode == 200) {
        var data = json.decode(result.toString());
        _goodsInfo = DetailsModel.fromJson(data);
        _pageStatus = 'success';
      } else {
        _pageStatus = 'error';
      }
    });
    notifyListeners();
  }

  setDetailInfoPageStatus(pageStatus) {
    _pageStatus = pageStatus;
    notifyListeners();
  }

  changeLeftAndRight(tab) {
    _tab = tab;
    if (tab == 'left') {
      _isLeft = true;
      _isRight = false;
    } else {
      _isLeft = false;
      _isRight = true;
    }
    notifyListeners();
  }
}
