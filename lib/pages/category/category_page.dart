import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/category/left_category_nav.dart';
import 'package:flutter_shop/pages/category/right_category_nav.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'), elevation: 0.0),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[RightCategoryNav()],
            )
          ],
        ),
      ),
    );
  }
}
