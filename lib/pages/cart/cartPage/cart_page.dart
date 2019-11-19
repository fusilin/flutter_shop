import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/cart.dart';
import 'cart_item.dart';
import 'cart_bottom.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:oktoast/oktoast.dart';

class CartPage extends StatefulWidget {
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    YYDialog.init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartProvider>(context).getCartInfo();
    });
  }

  List _listView(list) {
    List<Widget> _item = [];
    list.forEach((item) {
      _item.add(CartItem(item));
    });
    return _item;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  provider.cartList.length > 0
                      ? showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text('删除提示'),
                              content: Text('确认清空购物车？'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: Text('取消'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text('确定'),
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    provider.remove();
                                    Navigator.pop(context);
                                    showToast(
                                      '删除成功',
                                      duration: Duration(seconds: 2),
                                      backgroundColor:
                                          Colors.black.withOpacity(0.5),
                                      position: ToastPosition.center,
                                      radius: 12.0,
                                    );
                                  },
                                ),
                              ],
                            );
                          })
                      : showToast(
                          '已经空空如意',
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.black.withOpacity(0.5),
                          position: ToastPosition.center,
                          radius: 12.0,
                        );
                })
          ],
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 120),
              children: _listView(provider.cartList),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: CartBottom(),
            ),
            Positioned(
              bottom: 55,
              right: 12,
              child: FloatingActionButton(
                heroTag: 'cartPage1111',
                onPressed: () {
                  provider.save(
                    DateTime.now().millisecondsSinceEpoch.toString(),
                    'test',
                    20,
                    80.9,
                    'https://images.baixingliangfan.cn/advertesPicture/20190131/20190131165032_5788.png',
                  );
                },
                child: new Icon(Icons.add),
              ),
            )
          ],
        ),
      );
    });
  }
}
