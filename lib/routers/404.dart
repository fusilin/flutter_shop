import 'package:flutter/material.dart';

class PageNotFind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('页面不存在'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 100.0),
          alignment: Alignment.center,
          child: Text('页面不存在'),
        ));
  }
}
