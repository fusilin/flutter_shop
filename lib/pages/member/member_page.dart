import 'package:flutter/material.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/pages/cart/cart_router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/animation/animation_router.dart';

class MemberPage extends StatefulWidget {
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget _myListTile(String title) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        onTap: () {
          title == '极光推送'
              ? NavigatorUtils.push(context, CartRouter.jsPush,
                  transition: TransitionType.inFromRight)
              : NavigatorUtils.push(context, AnimationRouter.animationPage);
        },
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('会员中心'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
//                _myListTile('领取优惠券'),
//                _myListTile('已领取优惠券'),
//                _myListTile('地址管理'),
//                _myListTile('客服电话'),
                _myListTile('极光推送'),
                _myListTile('动画'),
              ],
            ),
          )),
    );
  }
}
