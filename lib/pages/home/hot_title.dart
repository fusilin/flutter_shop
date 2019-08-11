import 'package:flutter/material.dart';

class HotTitle extends StatelessWidget {
  final String title;
  HotTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }


}
