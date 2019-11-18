import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_shop/model/cartInfo.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  String cartString = '';
  List<CartInfoMode> _cartList = [];
  bool _allIsCheck = false;
  double _totalMoney = 0;
  int _totalCount = 0;

  get cartList => _cartList;

  get allIsCheck => _allIsCheck;

  get totalMoney => _totalMoney;

  get totalCount => _totalCount;

  //得到购物车中的商品
  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获得购物车中的商品,这时候是一个字符串
    cartString = prefs.getString('cartInfo');
    //把_cartList进行初始化，防止数据混乱
    _cartList = [];
    //判断得到的字符串是否有值，如果不判断会报错
    if (cartString == null) {
      _cartList = [];
      _allIsCheck = false;
      _totalMoney = 0;
      _totalCount = 0;
    } else {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((item) {
        _cartList.add(CartInfoMode.fromJson(item));
      });
      var listLength = _cartList.length;
      var tempLength = 0;
      double tempTotalMoney = 0;
      int tempTotalCount = 0;

      for (var i = 0; i < listLength; i++) {
        if (_cartList[i].isCheck) {
          tempLength++;
          tempTotalCount++;
          tempTotalMoney =
              tempTotalMoney + (_cartList[i].price * _cartList[i].count);
        }
      }
      _totalMoney = tempTotalMoney;
      _totalCount = tempTotalCount;
      if (listLength == tempLength) {
        _allIsCheck = true;
      } else {
        _allIsCheck = false;
      }
    }
    notifyListeners();
  }

  save(goodsId, goodsName, count, price, images, {isCheck = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    //把获得值转变成List
    List<Map> tempList = (temp as List).cast();
    //声明变量，用于判断购物车中是否已经存在此商品ID
    var isHave = false; //默认为没有
    int ival = 0; //用于进行循环的索引使用
    tempList.forEach((item) {
      //进行循环，找出是否已经存在该商品
      //如果存在，数量进行+1操作
      if (item['goodsId'] == goodsId) {
        tempList[ival]['count'] = item['count'] + 1;
        //关键代码-----------------start
        _cartList[ival].count++;
        //关键代码-----------------end
        isHave = true;
      }
      ival++;
    });
    //  如果没有，进行增加
    if (!isHave) {
      //关键代码-----------------start
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': isCheck,
      };
      tempList.add(newGoods);
      _cartList.add(CartInfoMode.fromJson(newGoods));
      //关键代码-----------------end
    }
    //把字符串进行encode操作，
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString); //进行持久化
    notifyListeners();
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _cartList = [];
    notifyListeners();
  }

  //删除单个购物车商品
  deleteOneGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int delIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString); //
    await getCartInfo();
  }

  addOrReduceAction(var cartItem, String todo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == cartItem.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    if (todo == 'add') {
      cartItem.count++;
    } else if (cartItem.count > 1) {
      cartItem.count--;
    }
    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString); //
    await getCartInfo();
  }

  changeIsCheck(var cartItem, val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempListLength = tempList.length;
    int changeIndex = 0;
    for (var i = 0; i < tempListLength; i++) {
      if (tempList[i]['goodsId'] == cartItem.goodsId) {
        changeIndex = i;
      }
    }
    cartItem.isCheck = val;
    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString); //
    await getCartInfo();
  }

  changeAllIsCheck(bool val) async {
    _allIsCheck = val;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempListLength = tempList.length;
    for (var i = 0; i < tempListLength; i++) {
      tempList[i]['isCheck'] = val;
    }
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString); //
    await getCartInfo();
  }
}
