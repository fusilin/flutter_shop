import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/counter_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import '../cart_router.dart';

class CartPage extends StatefulWidget {
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车'), elevation: 0.0),
      body: RaisedButton(
        onPressed: () => NavigatorUtils.push(context, CartRouter.nextCart),
        child: Text('进入地图页'),
      ),
      floatingActionButton:
          Consumer<CounterModel>(builder: (context, counter, child) {
        return FloatingActionButton(
            heroTag: 'cart_page',
            onPressed: () {
              counter.add();
            },
            child: Icon(Icons.add));
      }),
    );
  }
}
