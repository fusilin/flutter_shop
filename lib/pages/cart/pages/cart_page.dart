import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/counter_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import '../cart_router.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> testList = [];

  @override
  void initState() {
    super.initState();
  }

  void _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String t = '测试存储';
    testList.add(t);
    prefs.setStringList('testList', testList);
    _show();
  }

  void _show() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getStringList('testList') != null) {
        testList = prefs.getStringList('testList');
      }
    });
  }

  void _delete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('testList');
    setState(() {
      testList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车'), elevation: 0.0),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            child: ListView.builder(
              itemCount: testList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(testList[index]),
                );
              },
            ),
          ),
          RaisedButton(
            onPressed: () => _add(),
            child: Text('新增'),
          ),
          RaisedButton(
            onPressed: () => _delete(),
            child: Text('删除'),
          ),
        ],
      )),
    );
  }
}
