import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RightCategoryNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        height: ScreenUtil().setHeight(1034),
        width: ScreenUtil().setWidth(570),
        decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1, color: Colors.black12))),
        child: Consumer<ChildCategory>(builder: (context, childCategory, _) {
          return ListView.builder(
//            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkWel(childCategory.childCategoryList.length == 0
                  ? null
                  : childCategory.childCategoryList[index]);
            },
          );
        }));
  }

  Widget _rightInkWel(dynamic item) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: item['mallSubName']);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item == null ? '' : item['mallSubName'],
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
