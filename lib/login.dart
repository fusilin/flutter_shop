import 'package:flutter/material.dart';
//import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:flutter_shop/configs/service_url.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/common/common.dart';
import 'dart:convert';
import 'package:flutter_shop/constant/color_constant.dart';

class Login extends StatelessWidget {
  _login() {
//    var scope = 'snsapi_userinfo', state = 'wechat_login'; //随机数
//    fluwx
//        .sendWeChatAuth(scope: scope, state: state)
//        .then((result) => _getWXAccessToken(result))
//        .catchError((error) {});
  }

  _getWXAccessToken(result) {
    if (result.errCode == 0) {
      var _URL = servicePath['loginWXUrl'] +
          '?appid=' +
          Common.wxAppId +
          '&secret=' +
          Common.wxAppSecret +
          '&code=' +
          result.code +
          '&grant_type=authorization_code';
      request(cusUrl: _URL).then((result) {
        var data = json.decode(result.toString());
        _getUserInfo(data.access_token, data.openid);
      });
    }
  }

  //根据微信access_token获取微信用户信息
  _getUserInfo(access_token, openid) {
    var _URL = (servicePath['loginWXGuiUrl'] +
        '?access_token=' +
        access_token +
        '&openid=' +
        openid);
    request(cusUrl: _URL).then((result) {
      var data = json.decode(result.toString());
      _showUserInfoData(data);
    });
  }

  // 显示三方登录用户头像信息
  _showUserInfoData(data) {
//    SER_URL.third_openid = data.openid;
//    SER_URL.third_head_img = data.headimgurl;
//    SER_URL.third_nickname = data.nickname;
//    SER_URL.third_sex = data.sex;
    print(1111111);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        color: ColorConstant.theme,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
        onPressed: () => _login(),
        child: Text('微信登录'),
      ),
    );
  }
}
