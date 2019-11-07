import 'package:flutter/material.dart';

class FloorTitle extends StatelessWidget {
  final String pictureAddress; // 图片地址
  FloorTitle({Key key, this.pictureAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(pictureAddress),
    );
  }
}
