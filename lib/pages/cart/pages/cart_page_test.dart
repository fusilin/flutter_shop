import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/counter_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import '../cart_router.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final JPush jpush = new JPush();
  String debugLable = 'Unknown';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  void initPlatformState() async {
    String platformVersion;
    try {
      //监听响应方法的编写
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        print(">>>>>>>>>>>>>>>>>flutter 接收到推送: $message");
        setState(() {
          debugLable = "接收到推送: $message";
        });
      });
    } on PlatformException {
      platformVersion = '平台版本获取失败，请检查！';
    }

    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车'), elevation: 0.0),
      body: Center(
          child: new Column(children: [
        new Text('结果: ${debugLable}'),
        new FlatButton(
            child: new Text('发送推送消息\n'),
            onPressed: () {
              // 三秒后出发本地推送
              var fireDate = DateTime.fromMillisecondsSinceEpoch(
                  DateTime.now().millisecondsSinceEpoch + 3000);
              var localNotification = LocalNotification(
                id: 234,
                title: 'title',
                buildId: 1,
                content: '看到了说明已经成功了',
                fireTime: fireDate,
                subtitle: '一个测试',
              );
              jpush.sendLocalNotification(localNotification).then((res) {
                setState(() {
                  debugLable = res;
                });
              });
            }),
      ])),
//      floatingActionButton: Consumer<CounterModel>(
//        builder: (context, counter, child) {
//          return FloatingActionButton(
//              heroTag: 'cart_page',
//              onPressed: () {
//                counter.add();
//              },
//              child: Icon(Icons.add));
//        },
//      ),
    );
  }
}
