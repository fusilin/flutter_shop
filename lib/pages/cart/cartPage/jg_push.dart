import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/widget/index.dart' show WhiteSpace;
import 'package:flutter_shop/constant/color_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JgPush extends StatefulWidget {
  _JgPushState createState() => _JgPushState();
}

class _JgPushState extends State<JgPush> {
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
//        print(">>>>>>>>>>>>>>>>>flutter 接收到推送: $message");
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
      appBar: AppBar(title: Text('极光推送'), elevation: 0.0),
      body: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(15.0),
          child: new Column(
            children: [
              new FlatButton(
                  child: Center(
                    child: new Text(
                      '点击发送推送消息\n',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: ScreenUtil().setSp(32.0)),
                    ),
                  ),
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
              WhiteSpace(),
              Text('结果: ${debugLable ?? '等待中...'}'),
            ],
          )),
    );
  }
}
